module Intcode
    def self.run(program)
        seq = program.split(",").map! { |int| int.to_i }
        index = 0
        while true do
            case seq[index]
            when 1
                # for example, in the program [1, 9, 10, 6...] the values at indices 9 and 10 would be added to overwrite the value at position 6
                seq[seq[index + 3]] = seq[seq[index + 1]] + seq[seq[index + 2]]
                index += 4
            when 2
                seq[seq[index + 3]] = seq[seq[index + 1]] * seq[seq[index + 2]]
                index += 4
            when 99
                return seq.join(",")
            end
        end
    end
end