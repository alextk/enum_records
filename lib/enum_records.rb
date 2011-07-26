module EnumRecords

  module ActiveRecord

    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
    end

    module ClassMethods

      def acts_as_enum(enum_column_name = 'enum_key')
        self.class_eval do
          # first cehck for enum column name existance
          raise ArgumentError, "Enum column #{enum_column_name} doesn't exsist in the table" unless self.columns_hash.keys.include?(enum_column_name)

          # stores all the names for named records (and their optoins) that are defined in the model.
          self.class_attribute :_enums
          self._enums = {
            :definitions => {},
            :column_name => enum_column_name
          }

          #define class methods
          def self.define_enums *args, &block
            self._enums[:globalized] = self.respond_to?(:translations_table_name)
            EnumRecords::Definer.new self, &block
          end

          def self.enums
            self.where(self._enums[:column_name].to_sym => self._enums[:definitions].keys)
          end

          def self.enum(key)
            self.send "find_by_#{self._enums[:column_name]}", key
          end

        end
      end
    end

    module InstanceMethods
      # return this instance enum atttributes as were passed at enum definition
      # note that all atttributes are returned (both database and non database).
      # note that database atttribute value can be different from enum attribute value (because it was changed in db by someone else)
      def enum_attributes
        enum_column_name =  self.class._enums[:column_name]
        self.class._enums[:definitions][self.send(enum_column_name)]
      end
    end

  end

  # use the Enumeration class capture enum names as methods or contants
  class Definer
    def initialize model_class, &block
      @model_class = model_class
      EnumNameCapturer.new(self, &block)
    end

    def add_new_enum(method_sym, options)
      # Check that the model's translation table exist if locales are passed so that in migration we will not have an exception
      return if @model_class._enums[:globalized] && !@model_class.connection.table_exists?(@model_class.translations_table_name)

      enum_name = method_sym.to_s
      @model_class._enums[:definitions][enum_name] = options

      # Reject options that aren't real data base fields.
      fields = options.reject { |k, v| !@model_class.columns_hash.keys.include?(k.to_s) }

      localized_fields = options[:locales] || {}
      
      # Create or find the record associated with the enum.
      if !localized_fields.blank? # In case locales hash is passed
        # Reject options that aren't real data base fields for localized fields.
        for locale in localized_fields.keys
          localized_fields[locale] = localized_fields[locale].reject { |k, v| !@model_class.columns_hash.keys.include?(k.to_s) }
        end
        if @model_class.enum(enum_name).nil? #enum hasn't been created yet
          record = find_or_create_enum_record(enum_name, fields)
          localized_fields.each_pair do |locale, l_fields|
            Globalize.with_locale locale do
              record.update_attributes(l_fields)
            end
          end
        end
      else # no localization needed => create or find the record associated with the enum.
        find_or_create_enum_record(enum_name, fields)
      end
    end

    def find_or_create_enum_record(enum_name, fields)
      @model_class.send "find_or_create_by_#{@model_class._enums[:column_name]}", enum_name, fields
    end
  end

  class EnumNameCapturer
    def initialize definer, &block
      @definer = definer
      instance_eval(&block)
    end

    def method_missing method_sym, *args, &block
      @definer.add_new_enum method_sym, args[0]
    end
  end

end


ActiveRecord::Base.send :include, EnumRecords::ActiveRecord
