class Page < ActiveRecord::Base
  acts_as_enum

  translates :title, :intro

  define_enums do
    home :position=>1, :published => true, :locales => {'en-US'=>{:title=>'Home'}, 'he-IL'=>{:title=>'דף הבית'}}
    profile :position=>2, :published => true, :locales=>{'en-US'=>{:title=>'Profile'}, 'he-IL'=>{:title=>'פרופיל'}}
    project_categories :position=>3, :published=>true, :locales=>{'en-US'=>{:title=>'Projects'}, 'he-IL'=>{:title=>'פרויקטים'}}
  end
end
