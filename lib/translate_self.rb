require_relative 'translate_self/version'
require_relative 'translate_self/translation'
require_relative 'translate_self/translatable_string'
require 'ext/string'
require 'deepl'

# Dangerously include translation methods to strings!
module TranslateSelf
  include Translation
  class Error < StandardError; end
  DeepL.configure do |config|
    config.host = 'https://api-free.deepl.com' # Default value is 'https://api.deepl.com'
  end
  AVAILABLE_LANGUAGES = %w[bg cs da de el en es et fi fr hu it ja lt lv nl pl pt ro ru sk sl sv zh].freeze
end
