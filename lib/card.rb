class Card
    attr_reader :type
    attr_reader :value
    attr_reader :desc

    def initialize(type, value, desc) # each card has a type, value, and description
        @type = type
        @value = value
        @desc = desc
    end

    def to_s # puts card will return the type as a string
        return @type.to_s
    end
end
