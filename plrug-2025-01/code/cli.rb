require 'minitest/autorun'
require 'minitest/pride'

describe 'CLI' do
  it 'outputs help' do
    _(-> { CLI.new(argv: %w[cli --help]).run }).must_output "Help info!\n"
  end
end

class CLI
  def initialize(argv: ARGV) = @argv = argv

  def run = puts 'Help info!'

  private attr_reader :argv
end
