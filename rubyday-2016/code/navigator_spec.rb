require 'bogus/rspec'

class Navigator
  def initialize(plane)
    @plane = plane
  end

  def best_route(src, dst)
    connection?(src, dst) ? [src, dst] : indirect_route(src, dst)
  end

  private

  def connection?(src, dst)
    @plane.flights_from(src).include?(dst)
  end

  def indirect_route(src, dst)
    stops = @plane.flights_from(src)
    layover = stops.find { |stop| connection?(stop, dst) }
    layover ? [src, layover, dst] : fail('¯\ˍ(ツ)ˍ/¯')
  end
end

describe Navigator do
  describe '#best_route' do
    it 'routes directly for charters' do
      charter = fake(:plane)
      stub(charter).flights_from('WAW') { %w(FLR) }
      navigator = Navigator.new(charter)
      route = navigator.best_route('WAW', 'FLR')
      expect(route).to eq %w(WAW FLR)
    end

    it 'routes indirectly for scheduled flights' do
      scheduled = fake(:plane)
      stub(scheduled).flights_from('WAW') { %w(CDG) }
      stub(scheduled).flights_from('CDG') { %w(FLR) }
      navigator = Navigator.new(scheduled)
      route = navigator.best_route('WAW', 'FLR')
      expect(route).to eq %w(WAW CDG FLR)
    end
  end
end
