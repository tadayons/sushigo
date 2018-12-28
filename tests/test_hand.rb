require "./lib/hand.rb"
require "test/unit"

class TestHand < Test::Unit::TestCase
    
    
    def test_wasabi()
        wasabi = Hand.new("wasabi")
        wasabi.cards = [
            Card.new(:tempura, 2.5, :tempura), 
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:nigiri, 2, :salmon),
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi),
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:maki, 2, :twomaki),
            Card.new(:maki, 3, :threemaki),
            Card.new(:maki, 1, :onemaki),
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:nigiri, 3, :squid),
            Card.new(:nigiri, 1, :egg),
            Card.new(:pudding, nil, :pudding),
            Card.new(:chopsticks, nil, :chopsticks),
        ]
        
        (score, cards) = wasabi.wasabi()

        result = [:tempura, :sashimi, :dumplings, :maki, :maki, :maki, :pudding, :chopsticks]
        
        assert_equal([18, result], [score, get_type(wasabi)]) #get_type(nigiri), not nigiri.get_type bc get_type not a hand method
    end
    
        
    def test_nigiri()
        nigiri = Hand.new("nigiri")
        nigiri.cards = [
        Card.new(:tempura, 2.5, :tempura), 
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 2, :salmon),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:sashimi, 3.33, :sashimi),
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:maki, 2, :twomaki),
        Card.new(:maki, 3, :threemaki),
        Card.new(:maki, 1, :onemaki),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 3, :squid),
        Card.new(:nigiri, 1, :egg),
        Card.new(:pudding, nil, :pudding),
        Card.new(:chopsticks, nil, :chopsticks),
        ]
        (score, cards) = nigiri.counting(:nigiri)

        result = [:tempura, :wasabi, :wasabi, :sashimi, :dumplings,
        :maki, :maki, :maki, :wasabi, :pudding, :chopsticks]
        
        assert_equal([6, result], [score, get_type(nigiri)]) #get_type(nigiri), not nigiri.get_type bc get_type not a hand method

    
        nonigiri = Hand.new("no nigiri")
        nonigiri.cards = [
        Card.new(:tempura, 2.5, :tempura), 
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:sashimi, 3.33, :sashimi),
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:maki, 2, :twomaki),
        Card.new(:maki, 3, :threemaki),
        Card.new(:maki, 1, :onemaki),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:pudding, nil, :pudding),
        Card.new(:chopsticks, nil, :chopsticks),
        ]

        (score, cards) = nonigiri.counting(:nigiri)

        result = [:tempura, :wasabi, :wasabi, :sashimi, :dumplings,
        :maki, :maki, :maki, :wasabi, :pudding, :chopsticks]
    
        assert_equal([0, result], [score, get_type(nonigiri)])

        allnigiri = Hand.new("all nigiri")
        allnigiri.cards = [
            Card.new(:nigiri, 2, :salmon),
            Card.new(:nigiri, 1, :egg),
            Card.new(:nigiri, 3, :squid),
            Card.new(:nigiri, 2, :salmon),
            Card.new(:nigiri, 1, :egg),
            Card.new(:nigiri, 3, :squid),
            Card.new(:nigiri, 2, :salmon),
            Card.new(:nigiri, 3, :squid),
            Card.new(:nigiri, 1, :egg),
        ]
            
        (score, cards) = allnigiri.counting(:nigiri)
    
        result = []
            
            assert_equal([18, result], [score, get_type(allnigiri)])
    end
    
    def test_sashimi()
        nosashimi = Hand.new("no sashimi")
        nosashimi.cards = [
        Card.new(:tempura, 2.5, :tempura), 
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 2, :salmon),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:maki, 2, :twomaki),
        Card.new(:maki, 3, :threemaki),
        Card.new(:maki, 1, :onemaki),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 3, :squid),
        Card.new(:nigiri, 1, :egg),
        Card.new(:pudding, nil, :pudding),
        Card.new(:chopsticks, nil, :chopsticks),
        ]
    
        (score, cards) = nosashimi.multiples(:sashimi)

        result = [:tempura, :wasabi, :nigiri, :wasabi, :dumplings,
            :maki, :maki, :maki, :wasabi, :nigiri, :nigiri, :pudding, 
            :chopsticks]
    
        assert_equal([0, result], [score, get_type(nosashimi)])


        somesashimi = Hand.new("some sashimi")
        somesashimi.cards = [
        Card.new(:tempura, 2.5, :tempura), 
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:sashimi, 3.33, :sashimi), 
        Card.new(:nigiri, 2, :salmon),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:sashimi, 3.33, :sashimi), 
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:maki, 2, :twomaki),
        Card.new(:sashimi, 3.33, :sashimi), 
        Card.new(:maki, 3, :threemaki),
        Card.new(:maki, 1, :onemaki),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 3, :squid),
        Card.new(:nigiri, 1, :egg),
        Card.new(:sashimi, 3.33, :sashimi), 
        Card.new(:pudding, nil, :pudding),
        Card.new(:chopsticks, nil, :chopsticks),
        ]
    
        
        result = [:tempura, :wasabi, :nigiri, :wasabi, :dumplings,
            :maki, :maki, :maki, :wasabi, :nigiri, :nigiri, :pudding, 
            :chopsticks]
            
        (score, cards) = somesashimi.multiples(:sashimi)

        assert_equal([10, result], [score, get_type(somesashimi)])

        manysashimi = Hand.new("many sashimi")
        manysashimi.cards = [
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:nigiri, 2, :salmon),
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:maki, 2, :twomaki),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:sashimi, 3.33, :sashimi),
            Card.new(:maki, 1, :onemaki),
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:nigiri, 3, :squid),
            Card.new(:nigiri, 1, :egg),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:pudding, nil, :pudding),
            Card.new(:chopsticks, nil, :chopsticks),
            ]
        
        (score, cards) = manysashimi.multiples(:sashimi)

        result = [:wasabi, :nigiri, :wasabi, :dumplings,
            :maki, :maki, :wasabi, :nigiri, :nigiri, :pudding, 
            :chopsticks]
    
        assert_equal([20, result], [score, get_type(manysashimi)])

        allsashimi = Hand.new("all sashimi")
        allsashimi.cards = [
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:sashimi, 3.33, :sashimi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:sashimi, 3.33, :sashimi),
            Card.new(:sashimi, 3.33, :sashimi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:sashimi, 3.33, :sashimi),
            Card.new(:sashimi, 3.33, :sashimi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:sashimi, 3.33, :sashimi),
            Card.new(:sashimi, 3.33, :sashimi),
        ]
        
        result = []
        (score, cards) = allsashimi.multiples(:sashimi)

        assert_equal([40, result], [score, get_type(allsashimi)])

    end 

    def test_dumpling()
        onedumpling = Hand.new("one dumpling")
        onedumpling.cards = [
        Card.new(:tempura, 2.5, :tempura), 
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 2, :salmon),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:sashimi, 3.33, :sashimi),
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:maki, 2, :twomaki),
        Card.new(:maki, 3, :threemaki),
        Card.new(:maki, 1, :onemaki),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 3, :squid),
        Card.new(:nigiri, 1, :egg),
        Card.new(:pudding, nil, :pudding),
        Card.new(:chopsticks, nil, :chopsticks),
        ]

        (score, cards) = onedumpling.multiples(:dumplings)

        result = [:tempura, :wasabi, :nigiri, :wasabi, :sashimi,
        :maki, :maki, :maki, :wasabi, :nigiri, :nigiri, :pudding, 
        :chopsticks]
        
        assert_equal([1, result], [score, get_type(onedumpling)])

        twodumpling = Hand.new("two dumpling")
        twodumpling.cards = [
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 2, :salmon),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:sashimi, 3.33, :sashimi),
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:maki, 2, :twomaki),
        Card.new(:maki, 3, :threemaki),
        Card.new(:maki, 1, :onemaki),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 3, :squid),
        Card.new(:nigiri, 1, :egg),
        Card.new(:pudding, nil, :pudding),
        Card.new(:chopsticks, nil, :chopsticks),
        ]

        (score, cards) = twodumpling.multiples(:dumplings)

        result = [:wasabi, :nigiri, :wasabi, :sashimi,
        :maki, :maki, :maki, :wasabi, :nigiri, :nigiri, :pudding, 
        :chopsticks]
        
        assert_equal([3, result], [score, get_type(twodumpling)])

        threedumpling = Hand.new("three dumpling")
        threedumpling.cards = [
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 2, :salmon),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:sashimi, 3.33, :sashimi),
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:maki, 2, :twomaki),
        Card.new(:maki, 3, :threemaki),
        Card.new(:maki, 1, :onemaki),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 3, :squid),
        Card.new(:nigiri, 1, :egg),
        Card.new(:pudding, nil, :pudding),
        Card.new(:dumplings, nil, :dumplings),
        ]

        result = [:wasabi, :nigiri, :wasabi, :sashimi,
        :maki, :maki, :maki, :wasabi, :nigiri, :nigiri, :pudding, 
        ]
        
        (score, cards) = threedumpling.multiples(:dumplings)

        assert_equal([6, result], [score, get_type(threedumpling)])

        sixdumpling = Hand.new("six dumpling")
        sixdumpling.cards = [
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 2, :salmon),
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:sashimi, 3.33, :sashimi),
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:maki, 2, :twomaki),
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:maki, 1, :onemaki),
        Card.new(:wasabi, nil, :wasabi),
        Card.new(:nigiri, 3, :squid),
        Card.new(:nigiri, 1, :egg),
        Card.new(:dumplings, nil, :dumplings),
        Card.new(:dumplings, nil, :dumplings),
        ]

        result = [:wasabi, :nigiri, :sashimi,
        :maki, :maki, :wasabi, :nigiri, :nigiri, 
        ]
        (score, cards) = sixdumpling.multiples(:dumplings)
        
        assert_equal([15, result], [score, get_type(sixdumpling)])

        
    end

    def test_tempura()
        notempura = Hand.new("no tempura")
        notempura.cards = [ 
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:nigiri, 2, :salmon),
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:maki, 2, :twomaki),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:maki, 3, :threemaki),
            Card.new(:maki, 1, :onemaki),
            Card.new(:nigiri, 3, :squid),
            Card.new(:nigiri, 1, :egg), 
            Card.new(:pudding, nil, :pudding),
            Card.new(:chopsticks, nil, :chopsticks),
            ]
            
            (score, cards) = notempura.multiples(:tempura)
            
            result = [:wasabi, :sashimi, :nigiri, :wasabi, :sashimi,
            :dumplings, :maki, :sashimi, :maki, :maki, :nigiri, :nigiri, 
            :pudding, :chopsticks]
            assert_equal([0, result], [score, get_type(notempura)])

            onetempura = Hand.new("one tempura")
            onetempura.cards = [ 
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:nigiri, 2, :salmon),
            Card.new(:tempura, 2.5, :tempura),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:maki, 2, :twomaki),
            Card.new(:maki, 3, :threemaki),
            Card.new(:maki, 1, :onemaki),
            Card.new(:nigiri, 3, :squid),
            Card.new(:nigiri, 1, :egg), 
            Card.new(:pudding, nil, :pudding),
            Card.new(:chopsticks, nil, :chopsticks),
            ]
            
            (score, cards) = onetempura.multiples(:tempura)
            
            result = [:wasabi, :sashimi, :nigiri, :sashimi,
            :dumplings, :maki, :maki, :maki, :nigiri, :nigiri, 
            :pudding, :chopsticks]

            assert_equal([0, result], [score, get_type(onetempura)])

            twotempura = Hand.new("two tempura")
            twotempura.cards = [ 
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:nigiri, 2, :salmon),
            Card.new(:tempura, 2.5, :tempura),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:maki, 2, :twomaki),
            Card.new(:maki, 3, :threemaki),
            Card.new(:tempura, 1, :tempura),
            Card.new(:nigiri, 3, :squid),
            Card.new(:nigiri, 1, :egg), 
            Card.new(:pudding, nil, :pudding),
            Card.new(:chopsticks, nil, :chopsticks),
            ]
            
            (score, cards) = twotempura.multiples(:tempura)
            
            result = [:wasabi, :sashimi, :nigiri, :sashimi,
            :dumplings, :maki, :maki, :nigiri, :nigiri, 
            :pudding, :chopsticks]

            assert_equal([5, result], [score, get_type(twotempura)])
    end

    def test_maki()
        nomaki = Hand.new("no maki")
        nomaki.cards = [ 
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:nigiri, 2, :salmon),
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:nigiri, 3, :squid),
            Card.new(:nigiri, 1, :egg), 
            Card.new(:pudding, nil, :pudding),
            Card.new(:chopsticks, nil, :chopsticks),
            ]
            
        (count, cards) = nomaki.counting(:maki)
        
        result = [:wasabi, :sashimi, :nigiri, :wasabi, :sashimi,
        :dumplings, :dumplings, :sashimi, :nigiri, :nigiri, 
        :pudding, :chopsticks]
        assert_equal([0, result], [count, get_type(nomaki)])


        twomaki = Hand.new("two maki")
        twomaki.cards = [ 
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:nigiri, 2, :salmon),
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:maki, 1, :onemaki),
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:maki, 2, :twomaki),
            Card.new(:nigiri, 3, :squid),
            Card.new(:nigiri, 1, :egg), 
            Card.new(:pudding, nil, :pudding),
            Card.new(:chopsticks, nil, :chopsticks),
            ]
            
        (count, cards) = twomaki.counting(:maki)
        
        result = [:wasabi, :sashimi, :nigiri, :wasabi, :sashimi,
        :dumplings, :dumplings, :sashimi, :nigiri, :nigiri, 
        :pudding, :chopsticks]
        assert_equal([3, result], [count, get_type(twomaki)])

        threemaki = Hand.new("three maki")
        threemaki.cards = [ 
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:nigiri, 2, :salmon),
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:maki, 1, :onemaki),
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:maki, 2, :twomaki),
            Card.new(:nigiri, 3, :squid),
            Card.new(:maki, 3, :threemaki),
            Card.new(:nigiri, 1, :egg), 
            Card.new(:pudding, 1, :pudding),
            Card.new(:chopsticks, 0, :chopsticks),
            ]
            
        (count, cards) = threemaki.counting(:maki)
        
        result = [:wasabi, :sashimi, :nigiri, :wasabi, :sashimi,
        :dumplings, :dumplings, :sashimi, :nigiri, :nigiri, 
        :pudding, :chopsticks]
        assert_equal([6, result], [count, get_type(threemaki)])

    end

    def test_pudding()
        onepudding = Hand.new("one pudding")
        onepudding.cards = [ 
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:nigiri, 2, :salmon),
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:maki, 1, :onemaki),
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:maki, 2, :twomaki),
            Card.new(:nigiri, 3, :squid),
            Card.new(:maki, 3, :threemaki),
            Card.new(:nigiri, 1, :egg), 
            Card.new(:pudding, 1, :pudding),
            Card.new(:chopsticks, nil, :chopsticks),
            ]
            
        (count, cards) = onepudding.counting(:pudding)
        
        result = [:wasabi, :sashimi, :nigiri, :wasabi, :sashimi,
        :dumplings, :maki, :dumplings, :sashimi, :maki, :nigiri, 
        :maki, :nigiri, :chopsticks]

        assert_equal([1, result], [count, get_type(onepudding)])
    end
    
    def test_chopsticks()
        chopsticks = Hand.new("chopsticks")
        chopsticks.cards = [
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:nigiri, 2, :salmon),
            Card.new(:wasabi, nil, :wasabi),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:maki, 1, :onemaki),
            Card.new(:dumplings, nil, :dumplings),
            Card.new(:sashimi, 3.33, :sashimi), 
            Card.new(:maki, 2, :twomaki),
            Card.new(:nigiri, 3, :squid),
            Card.new(:maki, 3, :threemaki),
            Card.new(:nigiri, 1, :egg), 
            Card.new(:pudding, 1, :pudding),
            Card.new(:chopsticks, 0, :chopsticks),
        ]

        (count, cards) = chopsticks.counting(:chopsticks)
        
        result = [:wasabi, :sashimi, :nigiri, :wasabi, :sashimi,
        :dumplings, :maki, :dumplings, :sashimi, :maki, :nigiri, 
        :maki, :nigiri, :pudding]

        assert_equal([0, result], [count, get_type(chopsticks)])
    end


    def get_type(hand) # helper function for tests- compare to results array
        cards = hand.cards
        card_types = []
        cards.each do |card|
            card_types << card.type
        end
        return card_types
    end
end
