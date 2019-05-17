# Skype::Call::Detect

Attempts to detect an ongoing Skype call using `pactl`. Will only ever work on systems with PulseAudio (aka Linux/UNIX-based systems).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'skype-call-detect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install skype-call-detect

## Usage

`Skype::Call::Detect.running?` will return `true` if there is an ongoing skype call.
```
2.6.3 :001 > require 'skype/call/detect'
 => true 
2.6.3 :002 > Skype::Call::Detect.running?
 => false 
2.6.3 :003 > 
```

## Contributing

Bug reports and pull requests are welcome.

## Inspired by
- https://askubuntu.com/questions/906160/is-there-a-way-to-detect-whether-a-skype-call-is-in-progress-dbus-pulseaudio
- https://github.com/kaspernj/pulseaudio

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
