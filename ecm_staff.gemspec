$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/staff/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_staff"
  s.version     = Ecm::Staff::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_staff"
  s.summary     = "ECM Module Template."
  s.description = "ECM Module Template."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.13"

  # ecm_staff
  s.add_dependency "active_admin-awesome_nested_set", ">= 0.0.5"
  # s.add_dependency "acts_as_list"
  s.add_runtime_dependency 'acts_as_list', '< 0.3.0', '>= 0'
  s.add_dependency "acts_as_markup"
  s.add_dependency "acts_as_published"
  s.add_dependency "awesome_nested_set"
  s.add_dependency "ecm_pictures", ">= 1.0.6.pre"
  s.add_dependency "friendly_id"
  s.add_dependency "globalize", "~> 3.1.0"
  s.add_dependency "activeadmin-translate"

  s.add_development_dependency "sqlite3"

  # Development Server
  s.add_development_dependency "thin"

  # Development Tools
  s.add_development_dependency "quiet_assets"
  s.add_development_dependency "i18n_generators"
  s.add_development_dependency "yaml_db"

  # Documentation
  s.add_development_dependency "yard"
  s.add_development_dependency "rails-erd"

  # Dummy app
  s.add_development_dependency 'activeadmin', '0.5.1'
  # s.add_development_dependency 'activeadmin', '< 0.6.3'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'i18n_routing'
  s.add_development_dependency 'therubyracer'
  s.add_development_dependency 'less-rails'
  s.add_development_dependency 'twitter-bootstrap-rails'

  # Localization
  s.add_development_dependency 'localeapp'

  # Tests
  s.add_development_dependency 'capybara', '< 2.0.0'
  s.add_development_dependency 'rspec-rails', '~> 2.0'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails', '~> 1.0'

  # Test automation
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'rb-inotify', '~> 0.9'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'

  # ruby 1.8.7
  # s.add_development_dependency 'acts_as_list', '< 0.3.0'
  s.add_development_dependency 'nokogiri', '< 1.6.0'
  s.add_development_dependency 'rubyzip', '< 1.0.0'
  s.add_development_dependency 'devise', '< 3.0.0'
  s.add_development_dependency 'inherited_resources', '< 1.4.1'
end
