require 'spec_helper'

describe('#band_validation') do
  it('saves only if name passes validation') do
    epic_band = Band.new({band_name: "Wierd Al Yankovic"})
    # horriband = Band.new({band_name: "Justin Beiber".*(5)})
    # bad_band = Band.new({band_name: ""})
    expect(epic_band.save).to(eq(true))
    # expect(horriband.save).to(eq(false))
    # expect(bad_band.save).to(eq(false))
  end
end

describe('#venue_validation') do
  it('saves only if name passes validation') do
    epic_venue = Venue.new({venue_name: "The Gorge"})
    # de_venued = Venue.new({venue_name: "Club 52".*(8)})
    # bad_venue = Venue.new({venue_name: ""})
    expect(epic_venue.save).to(eq(true))
    # expect(de_venued.save).to(eq(false))
    # expect(bad_venue.save).to(eq(false))
  end
end
