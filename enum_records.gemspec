# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{enum_records}
  s.version = ""

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Tkachev"]
  s.date = %q{2011-07-24}
  s.description = %q{TODO: longer description of your gem}
  s.email = %q{tkachev.alex@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "lib/enum_records.rb",
    "spec/db/database.yml",
    "spec/db/schema.rb",
    "spec/db/schema_loader.rb",
    "spec/enum_records_spec.rb",
    "spec/models/article.rb",
    "spec/models/document.rb",
    "spec/models/page.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/alextk/enum_records}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{TODO: one-line summary of your gem}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<activerecord>, [">= 3.0.9"])
      s.add_development_dependency(%q<activesupport>, [">= 3.0.9"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<globalize3>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<activerecord>, [">= 3.0.9"])
      s.add_dependency(%q<activesupport>, [">= 3.0.9"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<globalize3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<activerecord>, [">= 3.0.9"])
    s.add_dependency(%q<activesupport>, [">= 3.0.9"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<globalize3>, [">= 0"])
  end
end

