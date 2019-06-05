# frozen_string_literal: true

RSpec.describe "threaded_logging" do
  describe ".thread_fingerprint" do
    let(:fingerprints) { [] }

    it "returns unique for thread fingerprint" do
      block = proc { fingerprints << ThreadedLogging.thread_fingerprint }
      Array.new(2) { Thread.new(&block) }.each(&:join)
      expect(fingerprints.uniq.size).to eq(2)
      expect(fingerprints).to all(match(/\A[0-9a-f]{8}\z/))
    end
  end

  describe "#call" do
    before { Timecop.freeze("2018-01-25 20:00 UTC") }

    before { allow(ThreadedLogging).to receive(:thread_fingerprint).and_return("75f10407") }

    let(:io) { StringIO.new }
    let(:logger) { Logger.new(io) }
    let(:logs) { io.rewind && io.read }

    it "logs properly" do
      logger.debug "Hello\nworld!"

      expect(logs).to eq(<<~LOGS)
        D [2018-01-25T20:00:00.000000] #75f10407: Hello
        D [2018-01-25T20:00:00.000000] #75f10407: world!
      LOGS
    end
  end
end
