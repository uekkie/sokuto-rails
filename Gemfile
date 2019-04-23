source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Rails 5.2.2.1 
# https://weblog.rubyonrails.org/2019/3/13/Rails-4-2-5-1-5-1-6-2-have-been-released/
# Ruby 2.5.4
# https://www.ruby-lang.org/ja/news/2019/03/13/ruby-2-5-4-released/ 
# 脆弱性対応なのであげたほうがいい
# できるかぎりリリース前にあげるほうがいい
ruby '2.5.3'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sassc-rails'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5' # たまにおかしくなることがあるので、利用するかどうかは要検討
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false


gem 'devise'
gem 'haml-rails'
gem 'bootstrap', '4.3.1'
gem 'jquery-rails'
gem 'rails-i18n', '~> 5.1'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'acts_as_votable'
gem 'activerecord-import'

gem 'ransack'
gem 'kaminari'
gem 'faker' # 普通はプロダクションにダミーデータはいれない
gem 'initial_avatar'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails-erd'
  gem 'brakeman'
  gem 'bundler-audit'
end
