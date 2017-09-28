class PencilDurability::Paper
    attr_reader :paper_text

    def initialize
        @paper_text = ""
    end

    def write(input_text)
        @paper_text = input_text
    end
end