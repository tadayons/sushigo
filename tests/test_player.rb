require "./lib/player.rb"
require "test/unit"

class TestPlayer < Test::Unit::TestCase

    def test_initialize() # test initialization, for peace of mind
        player = Player.new("sara")
        assert_equal(player.name, "sara")
        assert_equal(player.active.type, "active")
        assert_equal(player.played.type, "played")
    end

    def test_play()
        player = Player.new("sara")
        player.active.cards = [
            Card.new(:tempura, 2.5, :tempura), 
            Card.new(:sashimi, 3.33, :sashimi),
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:maki, 2, :twomaki),
            Card.new(:maki, 3, :threemaki),
            Card.new(:maki, 1, :onemaki),
            Card.new(:nigiri, 2, :salmon),
            Card.new(:nigiri, 3, :squid),
            Card.new(:nigiri, 1, :egg),
            Card.new(:pudding, nil, :pudding),
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:chopsticks, nil, :chopsticks),
        ]

        first = player.active.cards[0] # a tempura card object
        player.play(first)
        assert_equal(first.type, player.played.cards[0].type)
        
    end

end

