# frozen_string_literal: true

RSpec.describe 'FrozenString' do
  describe 'Does some defrosting' do
    before do
      TranslateSelf.config.defrost = true
    end

    it 'can be used with frozen strings if defrosting' do
      str = 'greetings'
      str.to_language = 'fi'
      str.translate!
      expect('greetings').to eq 'terveisiä'
    end

    it 'can change self' do
      str = 'turtle'
      str.translate!
      expect('turtle').to eq 'kilpikonna'
    end

    it 'detects the source language of frozen strings' do
      'cat'.translate
      expect('cat'.language).to eq 'en'
    end
  end

  describe 'without defrosting' do
    it 'does not work if for some reason the user does not want to use defrost' do
      TranslateSelf.config.defrost = false
      str = 'Donatello'
      expect { str.to_language = 'fi' }.to raise_error(FrozenError)
    end
  end
end
