## [Unreleased]
- Nothing new yet. 

## [0.1.0] - 2021-06-02

- Initial release!
You can now translate strings! Be free!

## [0.2.0] - 2021-06-03

- Commentation and cleanup of unneeded files.

## [0.3.0] - 2021-06-03

- Gemfile.lock was not automatically updated, testing it a bit.
Seems like you need to update it by hand! 

## [0.4.0] - 2021-06-05

- The translated new string now knows what language it is. 

## [0.5.0] - 2021-06-06

- Add TranslatableString class to work around frozen string literal magic comment. 
  Also will not crash with frozen strings now. 

## [0.6.0] - 2021-06-08

- Add option to use ENV variable DEEPL_HOST

## [0.7.0] - 2021-06-08

- Get rid of duplicated code. Update `benchmark.rb`.

## [0.8.0] - 2021-06-08

- Add option to use the shorter `t_to_language_code` alias. 

## [0.9.0] - 2021-06-08

# Breaking change from 0.8!
- `t_to_language_code` was too much typing, so changed it to `to_language_code`. 

## [1.0.0] - 2021-06-11

- Refactored the translation part a bit. 
- Now you can translate strings that are over 30 kilobyte! 
  I couldn't test this too much because of the limits on the free plan, 
  but if you can test this feature, I'd be really happy to hear how it is working for you. 

## [1.0.1] - 2021-07-13

- I'm reading Polished Ruby, and I just learned that it's faster to pass symbols than strings sometimes, 
so as this library is very performance-oriented, symbols it is! 