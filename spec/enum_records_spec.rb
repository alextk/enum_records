require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ActiveRecord::Base" do
  it "should respond to :define_enums" do
    ActiveRecord::Base.respond_to?(:acts_as_enum).should be_true
  end
end

describe "Article" do
  it "should not act_as_enum" do
    Article.should_not respond_to :define_enums
    Article.should_not respond_to :enums
    Article.should_not respond_to :enum
  end

  it "should check for enum column existance" do
    lambda { Article.acts_as_enum }.should raise_error
  end
end

describe "Document" do

  before(:all) do
    @non_enum = Document.create(:name => 'not enum')
  end

  it "should act_as_enum" do
    Document.should respond_to :define_enums
    Document.should respond_to :enums
    Document.should respond_to :enum
    Document._enums[:column_name].should == 'enum_key'
  end

  it 'should find defined "home" enum' do
    enum_doc = Document.enum(:home)
    enum_doc.should_not be_nil
    enum_doc.name.should == 'Home page'
    enum_doc.should == Document.enum('home')
  end

  it 'should not recreate defined enum' do
    enum_doc = Document.enum(:home)
    enum_doc.id.should == Document.enum(:home).id
    enum_doc.id.should == enum_doc.id.should
  end

  it 'should find defined "about" enum' do
    enum_doc = Document.enum(:about)
    enum_doc.should_not be_nil
    enum_doc.name.should == 'About page'
  end

  it 'should find defined "contact_form" enum' do
    enum_doc = Document.enum(:contact_form)
    enum_doc.should_not be_nil
    enum_doc.name.should == 'Contact us'
  end

  it 'should not find "foo" enum' do
    enum_doc = Document.enum(:foo)
    enum_doc.should be_nil
  end

  it 'should find 3 defined enums' do
    enums = Document.enums
    enums.length.should == 3
    Document.count.should == 4
    enums.should include(Document.enum(:home), Document.enum(:about), Document.enum(:contact_form))
    enums.should_not include(@non_enum)
  end

end

describe "Page" do
  before(:all) do
    @non_enum = Page.create(:title => 'not enum')
  end

  it 'should find 3 defined enums' do
    enums = Page.enums
    enums.length.should == 3
    Page.count.should == 4
    enums.should include(Page.enum(:home), Page.enum(:profile), Page.enum(:project_categories))
    enums.should_not include(@non_enum)
  end

  context 'should have localized enums fields' do

    it 'when locale is en-US' do
      I18n.locale = :'en-US'
      I18n.locale.should == :'en-US'
      Page.enum(:home).title.should == 'Home'
      Page.enum(:profile).title.should == 'Profile'
      Page.enum(:project_categories).title.should == 'Projects'
    end

    it 'when locale is he-IL' do
      I18n.locale = :'he-IL'
      I18n.locale.should == :'he-IL'
      Page.enum(:home).title.should == 'דף הבית'
      Page.enum(:profile).title.should == 'פרופיל'
      Page.enum(:project_categories).title.should == 'פרויקטים'
    end

  end

end
