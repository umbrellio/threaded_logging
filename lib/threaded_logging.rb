require "English"

module ThreadedLogging
  def call(severity, time, _progname, msg)
    time_string = time.strftime("%Y-%m-%dT%H:%M:%S.%6N")
    thread_id = Digest::MD5.hexdigest([Thread.current.object_id, $PID].join)[0...8]

    metadata = "#{severity[0]} [#{time_string}] ##{thread_id}:"

    message = ""
    msg.to_s.lines.each { |line| message << "#{metadata} #{line}" }
    "#{message}\n"
  end
end

::Logger::Formatter.prepend(ThreadedLogging)
