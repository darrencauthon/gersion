# Gersion

Look up the version of your Ruby application and any Ruby gems.

This gem assumes and requires the common Ruby setup, like:

  1) Your project uses git,
  2) Your server has git installed (no Heroku?), and
  3) You use Bundler with a Gemfile.lock file in your app's root.

The idea is that you could create a way to report back this information in your application... like a SHA key in the footer of your web app's HTML.

## Usage

### current_version

We'll consider the "current version" of your application as your git repo's HEAD. If it's tagged, the tag will be treated as the version.

```ruby
# my git HEAD is tagged as 1.2.3
Gersion.current_version # <= 1.2.3
```

If there is no tag, then it will report back the HEAD sha key.

```ruby
# my git HEAD is 9760260978ce5c68a319500509205654af4a6c9d
Gersion.current_version # <= 9760260978ce5c68a319500509205654af4a6c9d
```

### version_of

You may want to report back specific versions of gems that your application uses.

Say you want to see which version of Rails your web application runs:

```ruby
Gersion.version_of('rails') # <= 4.1.2
```

If your gem is pointed at a specific tag on a git repo, that will be reported:

```ruby
# my special gem is pointing at the 1.2.3 tag
Gersion.version_of('my_special_gem') # <= 1.2.3
```

If your gem is pointed at a git repo with no tag, that will be reported as well:

```ruby
# my special gem is pointing at the 87e7fae05aa289ab40326d0d162a7913f4a0ca59 sha
Gersion.version_of('my_special_gem') # <= 87e7fae05aa289ab40326d0d162a7913f4a0ca59
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gersion'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gersion

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gersion/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
