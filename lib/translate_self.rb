require_relative 'translate_self/version'
require_relative 'translate_self/translation'
require_relative 'translate_self/translatable_string'
require 'ext/string'
require 'deepl'

# Dangerously include translation methods to strings!
module TranslateSelf
  DeepL.configure do |config|
    config.auth_key = ENV['DEEPL_AUTH_KEY']
    config.host = ENV['DEEPL_HOST'] || 'https://api-free.deepl.com' # Default value is 'https://api.deepl.com'
  end
end
