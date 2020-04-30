require 'day1'

describe FuelCounter do
    it "calculates the fuel required to launch Santa's spaceship modules" do
        expect(FuelCounter::get_total(12)).to eq 2
        expect(FuelCounter::get_total(14)).to eq 2
        expect(FuelCounter::get_total(1969)).to eq 654
        expect(FuelCounter::get_total(100756)).to eq 33583
    end
end