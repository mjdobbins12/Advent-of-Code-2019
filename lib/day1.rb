module FuelCounter
    def self.get_total(mass)
        fuel = 0
        mass_to_add = (mass / 3 - 2)
        while mass_to_add > 0 do
            fuel += mass_to_add
            mass_to_add = (mass_to_add / 3 - 2)
        end
        fuel
    end
end