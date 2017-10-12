class PencilDurability::Paper
    attr_reader :paper_text, :index_of_erased

    def initialize
        @paper_text = ""
        @index_of_erased = []
    end

    def write(input_text)
        @paper_text += input_text
    end
    
    def erase(input, valid_erase)
        count = 0
        index = @paper_text.rindex(input)
        @index_of_erased << index
        
        while count < input.length
            @paper_text[index] = valid_erase[count]
            index += 1
            count += 1
        end
        @paper_text
    end

    def edit(input)
        index = @index_of_erased.pop

        if index
            input.split('').each do |character|
                if @paper_text[index] == ' '
                    @paper_text[index] = character
                else
                    @paper_text[index] = '@'
                end
                index += 1
            end
        end
        @paper_text
    end
end