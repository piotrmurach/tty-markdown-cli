# TTY::Markdown CLI

[![Gem Version](https://badge.fury.io/rb/tty-markdown-cli.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/tty-markdown-cli.svg?branch=master)][travis]
[![Build status](https://ci.appveyor.com/api/projects/status/3i2mn2nh9hq1cag2?svg=true)][appveyor]

[gem]: http://badge.fury.io/rb/tty-markdown-cli
[travis]: http://travis-ci.org/piotrmurach/tty-markdown-cli
[appveyor]: https://ci.appveyor.com/project/piotrmurach/tty-markdown-cli

> CLI tool for displaying Markdown documents in a nicely formatted terminal output.

**TTY::Markdown CLI** provides cli for [TTY::Markdown](https://github.com/piotrmurach/tty-markdown)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "tty-markdown-cli"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tty-markdown-cli

## Usage

Run `tty-markdown` with `-h` or `--help` options to print help information:

```bash
$ tty-markdown --help
```

To preview a Markdown document like this `README.md`:

```bash
$ tty-markdown README.md
```

To pipe a Markdown document like this `README.md` file:

```bash
$ cat README.md | tty-markdown
```

By default `UTF-8` symbols are used to display terminal output but you can fallback on more widely supported `ASCII` set with `-a/--ascii`:

```bash
$ tty-markdown -a README.md
$ tty-markdown --ascii README.md
```

Further, you can control the amount of indentation with `-i/--indent` option. By default 2 spaces are used but you can, for example, remove any indentation:

```bash
$ tty-markdown -i 0 README.md
$ tty-markdown --indent 0 README.md
```

You can also use `-w/--width` option to specify the maximum output width. By default the output will span the full terminal width. To make output wrap around `80` characters do:

```bash
$ tty-markdown -w 80 README.md
$ tty-markdown --width 80 README.md
```

To control output coloring, use `-c/--color` option with `always`, `never` or `auto`:

```bash
$ tty-markdown -c always README
$ tty-markdown --color always README
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/piotrmurach/tty-markdown-cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/piotrmurach/tty-markdown-cli/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the `tty-markdown-cli` project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/piotrmurach/tty-markdown-cli/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) 2020 Piotr Murach (piotrmurach.com). See LICENSE for further details.
