require 'byebug'
require 'deepl'

# The part where the actual translation happens.
module Translation
  attr_accessor :language, :to_language

  def available_languages
    TranslateSelf::AVAILABLE_LANGUAGES
  end

  def translate
    call_deepl(self, language, to_language)
  end

  def translate!
    replace translate
  end

  %w[bg cs da de el en es et fi fr hu it ja lt lv nl pl pt ro ru sk sl sv zh].each do |lan|
    define_method("translate_to_#{lan}") do |language = lan|
      call_deepl(self, self.language, language)
    end
  end

  private

  def call_deepl(text, language = self.language, to_lan = to_language)
    raise 'No language given!' if to_lan.nil?

    response = DeepL.translate text, language, to_lan
    self.language = response.detected_source_language.downcase if self.language.nil?
    response.text
  end
end
