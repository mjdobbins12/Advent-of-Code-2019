class Intcode
    def run(program)
        seq = program.split(",").map! { |int| int.to_i }
        seq = process(seq)
        seq.join(",")
    end

    def gravity_assist(program, output)
        seq = program.split(",").map! { |int| int.to_i }
        i = 0
        j = 0
        100.times do
            100.times do
                seq_copy = seq.dup
                seq_copy[1] = i
                seq_copy[2] = j
                process(seq_copy)
                return [i, j] if seq_copy[0] == output
                j += 1
            end
            i += 1
            j = 0
        end
    end

    private

    def process(seq)
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
                return seq
            end
        end
    end
end