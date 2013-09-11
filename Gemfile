source 'http://rubygems.org'

# Provides basic authentication functionality for testing parts of your engine
gem "spree_auth_devise", github: "spree/spree_auth_devise", branch: '1-3-stable'

# we use line_item_description_text which is in newer sprees
gem 'spree', github: 'freerunningtech/spree', branch: '1-3-stableish'

group :development, :test do
  gem 'fuubar'

  gem 'pry', github: 'pry/pry'
  gem 'pry-plus'
end

group :test do
  gem 'shoulda-matchers'
end

gemspec
