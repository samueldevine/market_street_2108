require 'rspec'
require './lib/renter.rb'
require './lib/apartment.rb'
require './lib/building.rb'

RSpec.describe do
  context 'building instantiation' do
    before :each do
      @building = Building.new
    end

    it 'exisits' do
      expect(@building).to be_a Building
    end

    it 'starts without any units' do
      expect(@building.units).to eq []
    end
  end

  context 'apartment interaction' do
    before :each do
      @building = Building.new
      @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
      @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
      @renter1 = Renter.new("Aurora")
      @renter2 = Renter.new("Tim")
      @building.add_unit(@unit1)
      @building.add_unit(@unit2)
    end

    it 'can add units' do
      expect(@building.units).to eq [@unit1, @unit2]
    end

    it 'starts without renters' do
      expect(@building.renters).to eq []
    end

    it 'can access renters of each unit' do
      @unit1.add_renter(@renter1)
      expect(@building.renters).to eq ["Aurora"]

      @unit2.add_renter(@renter2)

      expect(@building.renters).to eq ["Aurora", "Tim"]
    end

    it 'can calculate average rent' do
      expect(@building.average_rent).to eq 1099.5
    end
  end

  context 'Iteration 3' do
    before :each do
      @building = Building.new
      @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
      @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
      @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
      @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
      @renter1 = Renter.new("Spencer")
      @building.add_unit(@unit1)
      @building.add_unit(@unit2)
      @building.add_unit(@unit3)
    end

    it '#rented_units' do
      expect(@building.rented_units).to eq []

      @unit2.add_renter(@renter1)

      expect(@building.rented_units).to eq [@unit2]
    end

    it '#renter_with_highest_rent' do
      @unit2.add_renter(@renter1)

      expect(@building.renter_with_highest_rent).to eq @renter1

      renter2 = Renter.new("Jessie")
      @unit1.add_renter(renter2)
      expect(@building.renter_with_highest_rent).to eq renter2

      renter3 = Renter.new("Max")
      @unit3.add_renter(renter3)

      expect(@building.renter_with_highest_rent).to eq renter2
    end

    it '#units_by_number_of_bedrooms' do
      @building.add_unit(@unit4)
      result = {
        3 => ["D4"],
        2 => ["B2", "C3"],
        1 => ["A1"]
      }

      expect(@building.units_by_number_of_bedrooms).to eq result
    end
  end
end
