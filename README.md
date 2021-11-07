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

By default this gem uses the free DeepL servers, but you can also configure your own:

```sh
export DEEPL_HOST="non-free-host"
```

Now you can translate it to your language of chose with this gem!
```ruby
"hello world".translate_to_ja
# 世界よ、ハローだ
```

What's even better is that you can also save some typing by using the shortened alias such as below:

```ruby
"hello world".to_ja # or to_fi, to_ru... endless possibilities!
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


## Supported languages:

Supported languages are: Bulgarian, Chinese, Czech, Danish, Dutch, English, Estonian, Finnish, French, German, Greek, Hungarian, Italian, Japanese, Latvian, Lithuanian, Polish, Portuguese, Romanian, Russian, Slovak, Slovenian, Spanish, and Swedish.

## Usage

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

## Using with `# frozen_string_literal: true`

~~Does not work if you freeze the strings.~~ 

Now it does! 
Just use the classes `TranslatableString` (aliased to `TString`). 
So even if you have a magic comment making all your strings frozen, 
you can still use the `translate` method like below:

```ruby
hello = TranslatableString.new('hello', language: 'en', to_language: 'fi')
hello.translate
# "Moi"
```

OR!
Use it with [defrost](https://github.com/tenderlove/defrost)!
By default, defrost is not loaded. You can turn this on by setting `TranslateSelf.defrosting = true`, and after that, no need to worry about frozen strings!
This will defrost strings if they're frozen. 
Might be a bit slower, but it's worth it!
Interesting debug sessions guaranteed. 

## Benchmark

Create a string 5000000 times. 

```shell
C:\home\sampo\translate_self> ruby benchmark.rb 
Rehearsal --------------------------------------------------------
normal string          0.221517   0.000101   0.221618 (  0.221677)
monkeypatched string   0.267748   0.000000   0.267748 (  0.267865)
translatable string    1.878466   0.000000   1.878466 (  1.878497)
----------------------------------------------- total: 2.367832sec

                           user     system      total        real
normal string          0.225292   0.000000   0.225292 (  0.225289)
monkeypatched string   0.225690   0.000000   0.225690 (  0.225740)
translatable string    1.886653   0.000000   1.886653 (  1.886735)

```
So... the overhead might be surprisingly low!
If you use the TranslatableString class, there is some overhead. 
But if you just hack string it's pretty fast! See `benchmark.rb`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sampokuokkanen/translate_self. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/translate_self/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TranslateSelf project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/translate_self/blob/master/CODE_OF_CONDUCT.md).
