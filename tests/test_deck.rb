require "./lib/deck.rb"
require "test/unit"

class TestDeck < Test::Unit::TestCase
    def test_initialize()
        deck = Deck.new() # init a new deck

        deck.length.times do
            key = deck.pop().desc # pop first card object off of deck array
            deck.rubric[key][:count] -= 1
            
        end

        assert_equal(0, deck.length)
        deck.rubric.each do |k, v|
            assert_equal(0, v[:count])
        end
    end

    def test_pop
        deck = Deck.new()
        last = deck.cards.last
        assert_equal(last, deck.pop())
    end


end

