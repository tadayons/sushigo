require "./lib/table.rb"
require "test/unit"

class TestTable < Test::Unit::TestCase

    def test_initialize() # test that the player obj are created correctly and 
        # that new deck obj is created correctly
        
        # make sure that only 2-5 players allowed
        
        @names = ["sara", "martin", "max", "a", "b", "c"]
        [1, 6].each do |x|
            # the below block of code is asserted to raise an argument error
            assert_raise ArgumentError do 
                Table.new(x, @names)
            end
        end

        (2..5).each do |x|
            table = Table.new(x, @names)
            assert_equal(x, table.players.length)
            assert_equal(@names[x-2], table.players[x-2].name)
        end

        # test the creation of the deck
        table = Table.new(2, @names)
        assert_equal(table.deck.length, 108) # table.deck.deck is an array that holds the card objects

    end


    def test_deal() # check the number of cards dealt as fn of player #, test that dealing is done sequentially
        @names = ["sara", "martin", "max", "a", "b", "c"]
        (2..5).each do |x|
            table = Table.new(x, @names)
            table.deal
            table.players.each do |p|
                assert_equal(12-x, p.active.cards.length) # table.player.active.cards is the ARRAY that holds the active cards
            end
        end
    end

    def test_pass() 
        @names = ["sara", "martin", "max", "a", "b", "c"]
        (2..5).each do |x|
            table = Table.new(x, @names)
            @before = []
            table.players.each do |player|
                @before << player.active # add each players active hand object to the before array
            end
            @before.insert(0, @before.pop()) #pop off the last hand in the array, insert at beginning
            
            table.pass
                        
            @after = []
            table.players.each do |player|
                @after << player.active
            end

            assert_equal(@before, @after)
        end


        
    end



end
