# A class that let's you translate strings with
# the language and to_language params even if you happen to
# freeze them. Aliased to TString.
class TranslatableString < String
  def initialize(str, language: nil, to_language: nil)
    super str
    self.language = language
    self.to_language = to_language
  end
end
TString = TranslatableString
