gem 'bootstrap-sass'
gem 'bootswatch-rails'
gem 'font-awesome-rails'

application do
  %q`
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
  `
end

run 'wget https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml -P config/locales/'

remove_file '.gitignore'
create_file '.gitignore' do
  body = <<-EOS
/.bundle
/vendor/bundle
/db/*.sqlite3
/log/*.log
/tmp
.DS_Store
/public/assets*
/config/database.yml
newrelic.yml
.foreman
.env
doc/
*.swp
*~
.project
.idea
.secret
/*.iml
  EOS
end
