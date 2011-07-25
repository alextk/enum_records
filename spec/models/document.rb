class Document < ActiveRecord::Base
  acts_as_enum
  
  define_enums do
    home :name => 'Home page'
    about :name => 'About page', :html_title => 'about us'
    contact_form :name => 'Contact us'
  end

  #define 'Home', :name=>"home page"
  #define :About, :name=>"about page", :link_to => 'google'
end