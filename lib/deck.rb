require_relative './card.rb'

class Deck
    attr_reader :cards
    attr_reader :rubric
    
    def initialize()
        @cards = [] # initialize the cards array 
        @rubric = { # hash holding the number of cards for each type
            tempura: {
                count: 14, 
                value: 2.5, 
                type: :tempura,
            },
            sashimi: {
                count: 14, 
                value: 3.33, 
                type: :sashimi,
            },
            dumplings: {
                count: 14, 
                value: nil, 
                type: :dumplings,
            },
            twomaki: {
                count: 12, 
                value: 2, 
                type: :maki,
            },
            threemaki: {
                count: 8, 
                value: 3, 
                type: :maki,
            },
            onemaki: {
                count: 6, 
                value: 1, 
                type: :maki,
            },
            salmon: {
                count: 10, 
                value: 2, 
                type: :nigiri,
            },
            squid: {
                count: 5, 
                value: 3, 
                type: :nigiri,
            },
            egg: {
                count: 5, 
                value: 1, 
                type: :nigiri,
            },
            pudding: {
                count: 10, 
                value: 1, 
                type: :pudding,
            },
            wasabi: {
                count: 6, 
                value: nil, 
                type: :wasabi,
            },
            chopsticks: {
                count: 4, 
                value: 0, 
                type: :chopsticks,
            },
        } 
        @rubric.each do |k, v| # v is the value and another hash
            v[:count].times do
                @cards << Card.new(v[:type], v[:value], k) # add v number of cards initialized with k "type" to cards
            end
    
        end

        @cards.shuffle! # shuffle! will shuffle and save as @cards. just shuffle returns a new shuffled array
    end

    def to_s # override the usual ruby to_s method
        return @cards.inspect # .inspect returns a human-readable representation of the object
    end

    def pop
        return @cards.pop
    end

    def length
        return @cards.length
    end
end
