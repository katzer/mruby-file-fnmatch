# mruby-file-fnmatch <br> [![Build Status](https://travis-ci.com/katzer/mruby-file-fnmatch.svg?branch=master)](https://travis-ci.com/katzer/mruby-file-fnmatch) [![Build status](https://ci.appveyor.com/api/projects/status/8ek1sfuw1jw4igpb/branch/master?svg=true)](https://ci.appveyor.com/project/katzer/mruby-file-fnmatch/branch/master)

Path matching against patterns for [mruby][mruby] similar to shell filename globbing.

## Installation

Add the line below to your `build_config.rb`:

```ruby
MRuby::Build.new do |conf|
  # ... (snip) ...
  conf.gem 'mruby-file-fnmatch'
end
```

Or add this line to your aplication's `mrbgem.rake`:

```ruby
MRuby::Gem::Specification.new('your-mrbgem') do |spec|
  # ... (snip) ...
  spec.add_dependency 'mruby-file-fnmatch'
end
```

## Usage

The pattern is not a regular expression; instead it follows rules similar to shell filename globbing.

```ruby
File.fnmatch('**.rb', 'lib/song.rb')                 #=> true
File.fnmatch('c{at,ub}s', 'cats', File::FNM_EXTGLOB) #=> true
```

See the [ruby doc][ruby_doc_fnmatch] for more info.

## Development

Clone the repo:
    
    $ git clone https://github.com/katzer/mruby-file-fnmatch.git && cd mruby-file-fnmatch/

Compile the source:

    $ rake compile

Run the tests:

    $ rake test

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/katzer/mruby-file-fnmatch.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The mgem is available as open source under the terms of the [MIT License][license].

Made with :yum: in Leipzig

© 2018 Sebastián Katzer

[mruby]: https://github.com/mruby/mruby
[ruby_doc_fnmatch]: https://ruby-doc.org/core-2.5.1/File.html#method-c-fnmatch
[license]: http://opensource.org/licenses/MIT
