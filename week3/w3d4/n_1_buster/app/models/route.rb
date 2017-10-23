class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    # Create a hash with bus id's as keys and an array of bus
    # drivers as the corresponding value.
    buses = self.buses.includes(:drivers)

    bus_hash = Hash.new { |hash, k| hash[k] = [] }

    buses.each do |bus|
      bus_hash[bus.id] << bus.drivers.name
    end

    bus_hash
  end


  # def better_drivers_query
  #   buses = self.buses.includes(:drivers)
  #
  #   all_drivers = {}
  #   buses.each do |bus|
  #     drivers = []
  #     # will not fire a query for each route since drivers have already been prefetched
  #     bus.drivers.each do |driver|
  #       drivers << driver.name
  #     end
  #     all_drivers[bus.id] = drivers
  #   end
  #
  #   all_drivers
  # end

end
