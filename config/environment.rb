# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
#RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

ASYNC_RUNNERS = {:resque => 'resque', :workling => 'workling'}
ASYNC_RUNNER = :resque

# it is necessary to start the starling runner like this if spawn is installed.
Workling::Remote.dispatcher = Workling::Remote::Runners::StarlingRunner.new if ASYNC_RUNNER == ASYNC_RUNNERS[:starling]

# start starling with
    # sudo starling -d -p 22122
    # script/workling_client start


Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem "rspec-rails", :version => "1.3.2", :lib => 'spec/rails'
  config.gem "gherkin", :version => "1.0.26"
  config.gem "cucumber", :version => "0.7.2"
  config.gem "cucumber-rails", :version => "0.3.1", :lib => false
  config.gem "diff-lcs", :version => "1.1.2", :lib => 'diff/lcs'
  config.gem "jruby-openssl", :version => "0.7", :lib => false
  config.gem "json_pure", :version => "1.4.2"
  config.gem "neo4j", :version => "0.4.3"
  config.gem "nokogiri", :version => "1.4.1"
  config.gem "polyglot", :version => "0.3.1"
  config.gem "rack", :version => "1.0.1"
  config.gem "rack-test", :version => "0.5.3", :lib => 'rack/test'
  config.gem "rspec", :version => "1.3.0", :lib => 'spec'
  config.gem "term-ansicolor", :version => "1.0.5", :lib => "term/ansicolor"
  config.gem "treetop", :version => "1.4.5"
  config.gem "trollop", :version => "1.16.2"
  config.gem "webrat", :version => "0.7.1"

  config.load_paths += Dir["#{RAILS_ROOT}/vendor/gems/**"].map do |dir|
    File.directory?(lib = "#{dir}/lib") ? lib : dir
  end


  # Do not load unused async runners
  #config.gem -= (ASYNC_RUNNERS.delete { |k,v| k == ASYNC_RUNNER}).values

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  #config.frameworks -= [ :active_record ] #:active_resource,  :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de

end
