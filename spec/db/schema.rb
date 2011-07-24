ActiveRecord::Schema.define(:version => 0) do

  create_table :articles, :force => true do |t|
    t.string :name
    t.timestamps
  end

  create_table :documents, :force => true do |t|
    t.string :name
    t.string :enum_key
    t.timestamps
  end

  create_table :pages do |t|
    t.string :title, :enum_key
    t.text :intro
    t.boolean :published
    t.integer :position
    t.timestamps
  end

end

require File.join(File.dirname(__FILE__), '..', 'models', 'page')
Page.create_translation_table! :title => :string, :intro => :text