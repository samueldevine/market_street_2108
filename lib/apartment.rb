class Apartment
  attr_reader :number,
              :monthly_rent,
              :bathrooms,
              :bedrooms,
              :renter

  def initialize(attributes)
    @number         = attributes.fetch(:number)
    @monthly_rent   = attributes.fetch(:monthly_rent)
    @bathrooms      = attributes.fetch(:bathrooms)
    @bedrooms       = attributes.fetch(:bedrooms)
    @renter         = nil
  end

  def add_renter(renter)
    @renter = renter
  end

  def renter_name
    if renter.nil?
      nil
    else
      renter.name
    end
  end
end
