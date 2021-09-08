class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.map do |unit|
      unit.renter_name
    end.compact
  end

  def average_rent
    sum = @units.sum do |unit|
      unit.monthly_rent
    end

    sum.to_f / @units.count
  end

  def rented_units
    @units.find_all do |unit|
      unit.renter
    end
  end

  def renter_with_highest_rent
    rented_units.max_by do |unit|
      unit.monthly_rent
    end.renter
  end

  def units_by_number_of_bedrooms
    units_by_bedrooms = {}

    @units.each do |unit|
      if units_by_bedrooms[unit.bedrooms].nil?
        units_by_bedrooms[unit.bedrooms] = [unit.number]
      else
        units_by_bedrooms[unit.bedrooms] << unit.number
      end
    end

    units_by_bedrooms
  end
end
