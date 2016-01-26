# CambridgeTts

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/cambridge_tts`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cambridge_tts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cambridge_tts

## Usage
```ruby
require 'cambridge_tts'
love = CambridgeTts::Tts.new('love')
=> #<CambridgeTts::Tts:0x00000001dae408
 @link_mp3_uk="http://dictionary.cambridge.org/media/english/uk_pron/u/ukl/uklou/ukloudn014.mp3",
 @link_mp3_us="http://dictionary.cambridge.org/media/english/us_pron/l/lov/love_/love.mp3",
 @link_ogg_uk="http://dictionary.cambridge.org/media/english/uk_pron_ogg/u/ukl/uklou/ukloudn014.ogg",
 @link_ogg_us="http://dictionary.cambridge.org/media/english/us_pron_ogg/l/lov/love_/love.ogg",
 @word="love">
```
Save file to disk:
```ruby
love.save_to_file(love.link_mp3_uk)
=> #<File:ukloudn014.mp3>
Or With Path
love.save_to_file(love.link_mp3_uk, '/home/thiensubs/Documents/cambridge_tts/abc.mp3')
=> #<File:/home/thiensubs/Documents/cambridge_tts/abc.mp3>
```
NOTE: When word does not exist, lib will raise error

RuntimeError: Word Does Not Exits

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thiensubs/cambridge_tts. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

