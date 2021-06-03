# TranslateSelf

[![Gem Version](http://img.shields.io/gem/v/translate_self.svg)](https://rubygems.org/gems/translate_self)
[![Gem Downloads](https://img.shields.io/gem/dt/translate_self.svg)](https://rubygems.org/gems/translate_self)

Strings in Ruby are a bit hard to understand if you're not an English speaker. 
What does 
```ruby
"hello world"
```
even mean? I for one didn't study enough English to understand that!
But worry no more! 

[![asciicast](https://asciinema.org/a/TJU6H5iPopKrUwqwYnLUX3Y2o.svg)](https://asciinema.org/a/TJU6H5iPopKrUwqwYnLUX3Y2o)

Just get a DeepL auth key and export it as follows:

```sh
export DEEPL_AUTH_KEY="your-api-token"
```

This gem currently hardcodes the free DeepL servers. # TODO 

Now you can translate it to your language of chose with this gem!
```ruby
"hello world".translate_to_ja
# 世界よ、ハローだ
```

This gem uses the wonderful DeepL for Ruby as its backend.

https://github.com/wikiti/deepl-rb


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'translate_self'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install translate_self

## Usage

Currently available languages:

[:bg, :cs, :da, :de, :el, :en, :es, :et, :fi, :fr, :hu, :it, :ja, :lt, :lv, :nl, :pl, :pt, :ro, :ru, :sk, :sl, :sv, :zh]

You can assign a string a language:

```ruby
finn = "Oon suomalainen"
finn.language = 'fi'
```

This language will be passed on to DeepL when translating. 

You can also assign a to-language parameter:

```ruby
finn = "Oon suomalainen"
finn.to_language = 'en'
```

This way you can just use `translate` to get the string translated to English. 

```ruby
finn.translate
# I am a Finn
```

## Beware!

Does not work if you freeze the strings. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/translate_self. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/translate_self/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TranslateSelf project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/translate_self/blob/master/CODE_OF_CONDUCT.md).
