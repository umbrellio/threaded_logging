# frozen_string_literal: true

require "logger"
require "digest/md5"
require "English"

module ThreadedLogging
  def self.thread_fingerprint
    Digest::MD5.hexdigest([Thread.current.object_id, $PID].join)[0...8]
  end

  FORMAT = "%s [%s] #%s: %s"

  def call(severity, time, _progname, msg)
    message = +""

    msg2str(msg).to_s.lines.each do |line|
      message << format(
        FORMAT, severity[0], format_datetime(time), ThreadedLogging.thread_fingerprint, line
      )
    end

    message << "\n"
    message
  end

  private

  def format_datetime(time)
    time.strftime(@datetime_format || "%Y-%m-%dT%H:%M:%S.%6N")
  end
end

::Logger::Formatter.prepend(ThreadedLogging)
