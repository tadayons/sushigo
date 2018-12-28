require_relative './hand.rb'

class Player
    attr_reader :name  # does this need to be accessor too?
    attr_accessor :active
    attr_accessor :played

    def initialize(name)
        @name = name
        @active = Hand.new("active") # initialize a new Hand object of type active, the Hand object has an array in it that holds the card objects
        @played = Hand.new("played")
    end

    def play(card) # get card object from user to be "played"
        @played.cards << @active.cards.delete(card)  # delete the card object from the active hand (returns the card), append to the played hand (player.active.cards to player.played.cards)
    end

end

