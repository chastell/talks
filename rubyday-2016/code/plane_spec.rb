require 'bogus/rspec'

class Plane
  def initialize(type)
    @type = type
  end

  def flights_from(airport)
    fail '☃☃☃' if airport == 'WAW'   # śnieg! Schneefall! nevicata!
    case [airport, @type]
    when ['FLR', 'charter']   then %w(WAW)
    when ['FLR', 'scheduled'] then %w(CDG)
    else %w()
    end
  end
end

describe Plane do
  verify_contract :plane

  describe '#flights_from' do
    it 'returns destinations based on type' do
      charter_dsts   = Plane.new('charter').flights_from('FLR')
      scheduled_dsts = Plane.new('scheduled').flights_from('FLR')
      expect(charter_dsts).to include 'WAW'
      expect(scheduled_dsts).to_not include 'WAW'
    end
  end
end
