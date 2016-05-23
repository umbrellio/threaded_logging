# Description

This gem patches default ruby log formatter so that every line includes a digest of current process PID + currenct thread id so that you can easily grep the logs of every particular thread. It also adds the metadata part to each line of the message in case it is multiline.

Before:

```lang=ruby
> Logger.new(STDOUT).info("Line 1\nLine 2")
I, [2016-05-23T22:33:40.649346 #13604]  INFO -- : Line 1
Line 2
```

After:

```lang=ruby
> Logger.new(STDOUT).info("Line 1\nLine 2")
I [2016-05-23T22:32:30.483767] #bd134bb0: Line 1
I [2016-05-23T22:32:30.483767] #bd134bb0: Line 2
```

# Installation
Simply add `gem "threaded_logging"` to your Gemfile and you are done.

# Licence
MIT
