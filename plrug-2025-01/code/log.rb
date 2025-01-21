require 'minitest/autorun'
require 'minitest/pride'
require 'logger'

describe 'App' do
  it 'logs' do
    log = StringIO.new
    App.new(logger: Logger.new(log)).run
    _(log.tap(&:rewind).read).must_include 'App ran'
  end
end

class App
  def initialize(logger:) = @logger = logger

  def run = logger.info 'App ran'

  private attr_reader :logger
end
