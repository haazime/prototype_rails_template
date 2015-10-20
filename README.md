# prototype_rails_template
Rails template for prototyping

# Usage

- Prepare `rails new`

```bash
mkdir awesome_app
bundle init
bundle --path vendor/bundle
```

- Run `rails new` with this application template

```bash
bundle exec rails new . -T -B -m https://raw.github.com/haazime/prototype_rails_template/master/template.rb
```
