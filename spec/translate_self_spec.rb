RSpec.describe TranslateSelf do
  before do
    @hello = 'hello'
  end

  describe 'String translation hack test' do
    it 'has a version number' do
      expect(TranslateSelf::VERSION).not_to be nil
    end

    it 'can set the language of self' do
      expect { @hello.language = 'ja' }.to change { @hello.language }.to eq 'ja'
    end

    it 'can get a list of available languages' do
      expect(@hello.available_languages).to include 'fi'
    end

    it 'can translate hello to Finnish too' do
      expect(@hello.translate_to_fi).to eq 'Hei'
    end

    it 'can use aliased method names' do
      expect(@hello.to_fi).to eq 'Hei'
    end

    it 'recognizes a string as Finnish' do
      suomalainen = 'Oon suomalainen'
      finn = suomalainen.translate_to_en
      expect(suomalainen.language).to eq 'fi'
      expect(finn).to eq 'I am a Finn'
      expect(finn.language).to eq 'en'
    end

    # It sometimes returns こんにちわ...
    it 'uses the language set when translating' do
      @hello.to_language = 'ja'
      expect(@hello.translate).to match(/こんにち/)
    end

    it 'changes the value of the string itself when used with bang' do
      @hello.to_language = 'ja'
      @hello.translate!
      expect(@hello).to match(/こんにち/)
    end

    it 'does something useful' do
      expect(@hello.translate_to_ja).to match(/こんにち/)
    end

    it 'can break up text to sentences properly' do
      str = File.read('spaghetti.txt')
      sentences = str.send :break_text_into_sentences
      expect(sentences[-1]).to include 'email newsletter to hear about new eBooks.'
    end

    # EXPENSIVE TEST!!
    # it 'can translate strings over 30kb' do
    #   str = File.read('spaghetti.txt')
    #   expect(str.to_fi).to include 'VAIMONI ON LOISTAVA JOHTAJA. HÄNEN SPAGETTIATERIANSA OVAT MENESTYS'
    # end
  end

  describe 'TranslatableString' do
    it 'can be initialized with language and to_language' do
      str = TranslatableString.new('hello', language: 'en', to_language: 'fi')
      expect(str.translate).to eq 'Hei'
    end

    it 'will not crash if used without language param on self even if frozen' do
      str = TString.new('hello', to_language: 'fi').freeze
      expect(str.translate_to_fi).to eq 'Hei'
    end
  end
end
