require 'deepl'

# The part where the actual translation happens.
module Translation
  LANGUAGES = %w[bg cs da de el en es et fi fr hu it ja lt lv nl pl pt ro ru sk sl sv zh].freeze
  attr_accessor :language

  def to_language
    @to_language || 'fi'
  end

  def to_language=(language)
    defroster if needs_defrosting?
    @to_language = LANGUAGES.include?(language) ? language : 'fi'
  end

  def available_languages
    LANGUAGES
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
    call_deepl(language, to_language)
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
    defroster if needs_defrosting?
    replace translate
  end

  # Translates the string itself to a language the user wants to translate it to.
  # Sample usage:
  # 'hello'.translate_to_fi
  # # Hei
  #
  # @param [String] the language to translate to, e.g. "fi"
  # @return [String] the contents translated to another language
  LANGUAGES.each do |lan|
    define_method("translate_to_#{lan}".to_sym) do |language = lan|
      call_deepl(self.language, language)
    end
    alias_method "to_#{lan}".to_sym, "translate_to_#{lan}".to_sym
  end

  private

  def needs_defrosting?
    frozen? && TranslateSelf.config.defrosting
  end

  def defroster
    require 'defrost'
    defrost
  end

  def break_up(to_lan)
    sentences = break_text_into_sentences
    sentences.length.times.map.with_index do |_i, i|
      sentences[i].send "translate_to_#{to_lan}"
    end.join(' ')
  end

  def break_text_into_sentences
    last_letter = last_letter_of_self
    tr_count = (bytesize / 25_000.to_f).ceil
    sentences = split('.')
    number_of_sentences = sentences.length / tr_count
    current_count = 0
    tr_count.times.map do |num|
      txt = sentences[current_count..(current_count + number_of_sentences)].join('.')
      current_count += number_of_sentences.next
      if num == tr_count.pred
        txt + last_letter
      else
        txt
      end
    end
  end

  def last_letter_of_self
    end_with?('.') ? '.' : ''
  end

  def call_deepl(language = self.language, to_lan = to_language)
    warn 'No language given!' and return if to_lan.nil?
    return break_up(to_lan) if bytesize > 30_000

    response = DeepL.translate self, language, to_lan
    self.language = response.detected_source_language.downcase if !frozen? || (needs_defrosting? && defroster)
    actual_translation = response.text
    actual_translation.language = to_lan
    actual_translation
  end
end
