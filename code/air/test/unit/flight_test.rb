require 'test_helper'

class FlightTest < ActiveSupport::TestCase

  setup do
    @f = Flight.new number: "#{rand(900)+100}",
      departure_airport: 'ORD',
      departs_at: Time.now.beginning_of_day + rand(24.hours),
      arrival_airport: 'JFK',
      seats: rand(0..60)
  end

  test "a flight calculates its own mileage" do
    @f.save
    assert_equal 740, @f.miles
  end

  test "an invalid flight has a mileage of zero" do
    @f.arrival_airport = 'ZZZ'
    @f.save

    assert_equal 0, @f.miles
  end
end
