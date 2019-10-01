# threaded_logging &middot; [![Gem Version](https://badge.fury.io/rb/threaded_logging.svg)](https://badge.fury.io/rb/threaded_logging) [![Build Status](https://travis-ci.org/umbrellio/threaded_logging.svg?branch=master)](https://travis-ci.org/umbrellio/threaded_logging) [![Coverage Status](https://coveralls.io/repos/github/umbrellio/threaded_logging/badge.svg?branch=master)](https://coveralls.io/github/umbrellio/threaded_logging?branch=master)

This gem patches default Ruby log formatter so that every line includes a digest of current process PID + current thread id so that you can easily grep the logs of every particular thread. It also adds the metadata part to each line of the message in case it is multiline.

## Installation

```ruby
gem 'threaded_logging'
```

```shell
$ bundle install
# --- or ---
$ gem install 'threaded_logging'
```

```ruby
require 'threaded_logging'
```

## Usage

Before:

```ruby
> Logger.new(STDOUT).info("Line 1\nLine 2")
I, [2016-05-23T22:33:40.649346 #13604]  INFO -- : Line 1
Line 2
```

After:

```ruby
> Logger.new(STDOUT).info("Line 1\nLine 2")
I [2016-05-23T22:32:30.483767] #bd134bb0: Line 1
I [2016-05-23T22:32:30.483767] #bd134bb0: Line 2
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/umbrellio/table_sync.

## License

Released under MIT License.

## Authors

Created by Yuri Smirnov.

<a href="https://github.com/umbrellio/">
<img style="float: left;" src="https://umbrellio.github.io/Umbrellio/supported_by_umbrellio.svg" alt="Supported by Umbrellio" width="439" height="72">
</a>

TEST
