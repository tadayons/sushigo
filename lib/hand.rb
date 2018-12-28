
require_relative './card.rb'

class Hand # a class that will handle the aspects of a hand

    attr_accessor :cards
    attr_reader :type
    attr_reader :card_types
    

    def initialize(type)
        @type = type # store type (active or played) as instance var
        @cards = [] # create an instance var @cards which is an array that holds the card objects
    end

    def wasabi() # return wasabi score and remove wasabi and assoc. nigiri from hand
        l = @cards.length - 1
        score = 0
        delete = []
        @cards.each_with_index do |card, i|
            if card.type == :wasabi 
                # puts "this is the wasabi index #{i}"
                index = -1
                @cards[i..l].each_with_index do |card, ind| 
                    # puts "this is the after wasabi found card #{card.type}"
                    if card.type == :nigiri && !delete.include?(ind + i)
                        index = ind
                        break
                    end
                end

                unless index == -1
                    index = i + index
                    score = score + @cards[index].value * 3
                    # puts "\nthis is the score so far #{score}"
                    delete << index unless delete.include?(index) 
                end
                delete << i unless delete.include?(i)
            end
        end

        delete.sort!.reverse!.each do |i|
            @cards.delete_at(i)
        end
        
        return [score, @cards]
    end

   
    def counting(card_type) # for nigiri, maki, pudding, chopsticks cards
        score = 0
        delete = []

        @cards.each_with_index do |card, i|
            if card.type == card_type
                score = score + card.value
                delete << i
            end
        end

        delete.sort!.reverse!.each do |i|
            @cards.delete_at(i)
        end
        
        return [score, @cards]

    end

    def multiples(card_type) #for sashimi, tempura, dumpling cards
        score = 0
        delete = []

        
        @cards.each_with_index do |card, i|
            if card.type == card_type
                delete << i
            end            
        end
        
        if card_type == :sashimi
            score = ((delete.length / 3) * 10)
        elsif card_type == :tempura
            score = ((delete.length / 2) * 5)
        elsif card_type == :dumplings
            if delete.length > 5 
                score = 15
            else 
                score = (0..delete.length).sum
            end
        end

        delete.sort!.reverse!.each do |i|
            @cards.delete_at(i)
        end

        return [score, @cards]
    end

end

   
