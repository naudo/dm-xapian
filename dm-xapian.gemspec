Gem::Specification.new do |s|
  s.name = %q{dm-xapian}
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshaven Potter, Pascal Belloncle"]
  s.date = %q{2008-11-08}
  s.description = %q{Merb plugin that provides access to the Ruby Xapian search engine library}
  s.email = %q{yourtech@gmail.com, psq@nanorails.com}
  s.extra_rdoc_files = ["README.txt", "LICENSE", "TODO", "SETUP.txt", "CHANGES.txt"]
  s.files = ["LICENSE", "README.txt", "Rakefile", "TODO", "lib/dm-xapian.rb", "lib/dm-xapian/merbtasks.rb", "SETUP.txt", "CHANGES.txt", "bin/dm-xapian-updater"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/psq/dm-xapian}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Merb plugin that provides indexing of datamapper models using the Ruby Xapian search engine library}
  s.executables = ['dm-xapian-updater']
  
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<merb>, [">= 0.9.7"])
      s.add_runtime_dependency(%q<dm-core>, [">= 0.9.6"])
    else
      s.add_dependency(%q<merb>, [">= 0.9.7"])
      s.add_dependency(%q<dm-core>, [">= 0.9.6"])
    end
  else
    s.add_dependency(%q<merb>, [">= 0.9.7"])
    s.add_dependency(%q<dm-core>, [">= 0.9.6"])
  end
end
