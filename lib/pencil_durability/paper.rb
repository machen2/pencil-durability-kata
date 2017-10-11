class PencilDurability::Paper
    attr_reader :paper_text

    def initialize
        @paper_text = ""
    end

    def write(input_text)
        @paper_text += input_text
    end
    
    def erase(input)
        count = 0
        index = @paper_text.rindex(input)
        
        while count < input.length
            @paper_text[index] = " "
            index += 1
            count += 1
        end
    end
end