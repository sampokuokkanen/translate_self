require 'deepl'

# The part where the actual translation happens.
module Translation
  @@languages = %w[bg cs da de el en es et fi fr hu it ja lt lv nl pl pt ro ru sk sl sv zh].freeze
  attr_accessor :language, :to_language

  def available_languages
    @@languages
  end

  # Translates self to the desired language. \
  # Sample usage:
  # hello = 'hello'\
  # hello.to_language = 'fi'
  # moi = hello.translate
  # pp moi
  # # 'Hei'
  # @return [String] a new and shiny translated string!
  def translate
    call_deepl(self, language, to_language)
  end

  # Replaces self with the translation. \
  # Sample usage:
  # hello = 'hello'\
  # hello.to_language = 'fi'
  # hello.translate!
  # pp hello
  # # 'Hei'
  # @return [String] self replaced with the new translation
  def translate!
    replace translate
  end

  # Translates the string itself to a language the user wants to translate it to. \
  # Sample usage:
  # 'hello'.translate_to_fi
  # # Hei
  #
  # @param [String] the language to translate to, e.g. "fi"
  # @return [String] the contents translated to another language
  @@languages.each do |lan|
    define_method("translate_to_#{lan}") do |language = lan|
      call_deepl(self, self.language, language)
    end
  end

  private

  def call_deepl(text, language = self.language, to_lan = to_language)
    warn 'No language given!' and return if to_lan.nil?

    response = DeepL.translate text, language, to_lan
    self.language = response.detected_source_language.downcase if self.language.nil? && !frozen?
    actual_translation = response.text
    actual_translation.language = to_lan
    actual_translation
  end
end
