require 'bundler'

# define github repository uri
REPO_URI = 'https://raw.github.com/haazime/prototype_rails_template'
REPO_BRANCH = 'master'
ASSET_URI = "#{REPO_URI}/#{REPO_BRANCH}"

# twitter bootstap gems
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'boostrap-generators'

Bundler.with_clean_env do
  run 'bundle install --path vendor/bundle -j 4'
end

# config/application.rb
application do
  %q`
    # localize
    config.time_zone = 'Tokyo'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    # generators
    config.generators do |g|
      g.orm :active_record
      g.template_engine :erb
      #g.test_framework  :rspec, :fixture => true
      #g.fixture_replacement :factory_girl, :dir => "spec/factories"
      g.view_specs false
      g.controller_specs false
      g.routing_specs false
      g.helper_specs false
      g.request_specs false
      g.assets false
      g.helper false
    end
  `
end

# i18n japanese locale
run 'wget https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml -P config/locales/'

# gitignore
remove_file '.gitignore'
run "wget #{ASSET_URI}/gitignore -O .gitignore"

# assets for bootstrap
run 'rm -rf app/assets/javascripts/application.js'
run "wget #{ASSET_URI}/app/assets/javascripts/application.js -P app/assets/javascripts/"

run 'rm -rf app/assets/stylesheets/application.css'
run "wget #{ASSET_URI}/app/assets/stylesheets/application.css.scss -P app/assets/stylesheets/"
