require_relative './player.rb'
require_relative './deck.rb'
require_relative './hand.rb'

class Table

    attr_reader :players
    attr_reader :deck
    def initialize(places, names) # initializes the table with the chosen number of places and associated names
        if places < 2 || places > 5 
            raise ArgumentError.new("Number of players must be 2-5")
        end
        
        @players=[] # initialize array which holds the player objects
        (0...places).each do |p|
            @players << Player.new(names[p]) # @players is an array that holds the player objects
        end

        @deck = Deck.new() # new deck object, holds the @deck array of card objects
        # puts @deck # calls the to_s method in deck.rb, overriding the normal ruby to_s method
    
    end

    def deal() # will deal out the appropriate number of cards to each player
        
        case @players.length
            when 2 then cards = 10
            when 3 then cards = 9
            when 4 then cards = 8
            when 5 then cards = 7
        end

        cards.times do
            @players.each do |player|  #for each player object
                player.active.cards << @deck.pop() # add another card obj to the player.active array
            end                
        end
    end

    def pass() # will pass the active hands to the new player
        @a = @players[0].active # p1 hand
        
        (0...@players.length-1).each do |x|
            b = @players[x + 1].active # p2 hand
            @players[x + 1].active = @a # setting p2 hand to be what p1's hand was
            @a = b # moving p2 hand to var a and the cycle continues
        end

        @players[0].active = @a # take the final hand and set it to p1's hands
       
    end
end
