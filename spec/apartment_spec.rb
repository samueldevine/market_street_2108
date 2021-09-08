require 'rspec'
require './lib/renter.rb'
require './lib/apartment.rb'

RSpec.describe Apartment do

  before :each do
    @unit1 = Apartment.new({
                            number: "A1",
                            monthly_rent: 1200,
                            bathrooms: 1,
                            bedrooms: 1
                              })
  end

  context 'apartment instantiation' do
    it 'exists' do
      expect(@unit1).to be_an Apartment
    end

    it 'has attributes' do
      expect(@unit1.number).to eq "A1"
      expect(@unit1.monthly_rent).to eq 1200
      expect(@unit1.bathrooms).to eq 1
      expect(@unit1.bedrooms).to eq 1
    end
  end


  context 'renter interaction' do
    before :each do
      @renter1 = Renter.new("Jessie")
    end

    it 'starts empty' do
      expect(@unit1.renter).to be_nil
    end

    it 'can add a renter' do
      @unit1.add_renter(@renter1)

      expect(@unit1.renter).to eq @renter1
    end

    it 'can give me renter name' do
      expect(@unit1.renter_name).to be nil

      @unit1.add_renter(@renter1)

      expect(@unit1.renter_name).to eq "Jessie"
    end
  end
end
