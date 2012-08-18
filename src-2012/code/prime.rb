# coding: UTF-8

class PrimeSelector
  def initialize numbers
    @numbers = numbers
  end

  def primes
    @numbers.select { |number| prime? number }
  end

  private

  def prime? number
    (2..Math.sqrt(number).floor).all? { |i| (number % i).nonzero? }
  end
end



require 'logger'
require 'rcapture'

class Logging
  def initialize log
    @log = Logger.new log
    add_logging
  end

  private

  def add_logging
    PrimeSelector.class_eval { include RCapture::Interceptable }
    PrimeSelector.capture_pre methods: :prime? do |point|
      @log.debug "prime? #{point.args.first}"
    end
    PrimeSelector.capture_post methods: :prime? do |point|
      @log.debug "prime? → #{point.return}"
    end
  end
end

Logging.new $stdout
PrimeSelector.new(2..10).primes
