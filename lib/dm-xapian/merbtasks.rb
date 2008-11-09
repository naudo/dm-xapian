namespace :xapian do
  # Parameters - specify "flush=true" to save changes to the Xapian database
  # after each model that is updated. This is safer, but slower. Specify
  # "verbose=true" to print model name as it is run.
  desc 'Updates Xapian search index with changes to models since last call'
  task(:update_index => [:merb_env]) do
    # require 'ruby-debug'
    # Debugger.start
    # Debugger.settings[:autoeval] = true if Debugger.respond_to?(:settings)

    ActsAsXapian.configure(Merb.env||'development', Merb.root)
    ActsAsXapian.update_index(ENV['flush'] ? true : false, ENV['verbose'] ? true : false)
  end

  # Parameters - specify 'models="PublicBody User"' to say which models
  # you index with Xapian.
  # This totally rebuilds the database, so you will want to restart any
  # web server afterwards to make sure it gets the changes, rather than
  # still pointing to the old deleted database. Specify "verbose=true" to
  # print model name as it is run.
  desc 'Completely rebuilds Xapian search index (must specify all models)'
  task(:rebuild_index => [:merb_env]) do
    # require 'ruby-debug'
    # Debugger.start
    # Debugger.settings[:autoeval] = true if Debugger.respond_to?(:settings)

    raise "specify ALL your models with models=\"ModelName1 ModelName2\" as parameter" if ENV['models'].nil?
    ActsAsXapian.configure(Merb.env||'development', Merb.root)
    # Transform the array of model strings into an array of resource classes
    # Only retain resources which have been indexed by Xapian
    indexed_models = DataMapper::Resource.descendants.select { |m| m.include?(DataMapper::Xapian::InstanceMethods) }
    models_for_rebuild = []
    found_models = nil
    ENV['models'].split(" ").each do |m_name|
       found_models = indexed_models.select { |m| m.name == m_name }
       unless found_models.empty? 
         models_for_rebuild << found_models.first
       else
         raise "The model name #{m_name} is either unknown to " +
           "DataMapper or not indexed by Xapian"
       end
    end
    ActsAsXapian.rebuild_index(models_for_rebuild, ENV['verbose'] ? true : false)
  end

  # Parameters - are models, query, offset, limit, sort_by_prefix,
  # collapse_by_prefix
  desc 'Run a query, return YAML of results'
  task(:query => [:merb_env]) do
    ActsAsXapian.configure(Merb.env||'development', Merb.root)
    raise "specify models=\"ModelName1 ModelName2\" as parameter" if ENV['models'].nil?
    raise "specify query=\"your terms\" as parameter" if ENV['query'].nil?
    s = ActsAsXapian::Search.new(ENV['models'].split(" "), 
        ENV['query'],
        :offset => (ENV['offset'] || 0), :limit => (ENV['limit'] || 10),
        :sort_by_prefix => (ENV['sort_by_prefix'] || nil), 
        :collapse_by_prefix => (ENV['collapse_by_prefix'] || nil)
    )
    STDOUT.puts(s.results.to_yaml)
  end
end
