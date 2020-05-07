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
        current_x = 0
        current_y = 0
        wire.each do |instruction|
            magnitude = instruction[1..-1].to_i
            case instruction[0]
            when "R"
                points << [(current_y..(current_y + magnitude)), current_x]
                current_x += magnitude
            when "L"
                points << [((current_y + magnitude)..current_y), current_x]
                current_x -= magnitude
            when "U"
                points << [current_y, (current_x..(current_x + magnitude))]
                current_y += magnitude
            when "L"
                points << [current_y, (current_x..(current_x + magnitude))]
                current_y -= magnitude
            end
        end
        points
    end
end