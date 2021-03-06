# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mongoid_money}
  s.version = "0.2.1"
  s.authors = ["Jeff Bozek"]
  s.date = %q{2011-05-30}
  s.description = %q{Money datatype for Mongoid. Inspired by Ruby Money. Makes handling money simple. Stores the value in the db as cents. Currently handles USD.}
  s.email = %q{jeff.bozek@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    "lib/mongoid_money.rb",
    "lib/mongoid_money/conversions.rb",
    "lib/mongoid_money/money.rb"
  ]
  s.homepage = %q{http://github.com/jeffbozek/mongoid_money}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.summary = %q{Money datatype for Mongoid. Inspired by Ruby Money.}
  s.test_files = [
    "spec/conversion_spec.rb",
    "spec/money_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/dummy_money.rb"
  ]
  end
end

