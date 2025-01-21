### I|O testing: CLI

```ruby
describe 'CLI' do
  it 'outputs help' do
    _(-> { CLI.new(argv: %w[cli --help]).run }).must_output "Help info!\n"
  end
end
```
<!-- .element class="fragment" -->
```ruby
class CLI
  def initialize(argv: ARGV) = @argv = argv

  def run = puts 'Help info!'

  private attr_reader :argv
end
```
<!-- .element class="fragment" -->


### I|O testing: logs

```ruby
describe 'App' do
  it 'logs' do
    log = StringIO.new
    App.new(logger: Logger.new(log)).run
    _(log.tap(&:rewind).read).must_include 'App ran'
  end
end
```
<!-- .element class="fragment" -->
```ruby
class App
  def initialize(logger: Rails.logger) = @logger = logger

  def run = logger.info 'App ran'

  private attr_reader :logger
end

```
<!-- .element class="fragment" -->
