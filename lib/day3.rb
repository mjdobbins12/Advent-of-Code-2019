class Wires
    def initialize(wire_1, wire_2)
        @wire_1 = wire_1.split(",")
        @wire_2 = wire_2.split(",")
    end

    def closest_intersection_distance
        points_1 = find_points(@wire_1)
        points_2 = find_points(@wire_2)
    end

    private

    def find_points(wire)
        points = []
        current_position = [0, 0]
        wire.each do |instruction|
            case instruction[0]
            when "R"
                current_position[0] += instruction[1..-1].to_i
            when "L"
                current_position[0] -= instruction[1..-1].to_i
            when "U"
                current_position[1] += instruction[1..-1].to_i
            when "L"
                current_position[1] -= instruction[1..-1].to_i
            end
        end
        current_position
    end
end