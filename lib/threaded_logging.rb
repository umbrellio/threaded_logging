# frozen_string_literal: true

require "logger"
require "digest"
require "English"

module ThreadedLogging
  def self.thread_fingerprint
    Digest::MD5.hexdigest([Thread.current.object_id, $PID].join)[0...8]
  end

  def call(severity, time, _progname, msg)
    time_string = time.strftime("%Y-%m-%dT%H:%M:%S.%6N")
    metadata = "#{severity[0]} [#{time_string}] ##{ThreadedLogging.thread_fingerprint}:"

    message = +""
    msg.to_s.lines.each { |line| message << "#{metadata} #{line}" }
    "#{message}\n"
  end
end

::Logger::Formatter.prepend(ThreadedLogging)
