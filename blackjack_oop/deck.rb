# deck of cards


module Deck
  
def deck_create(n)

  deck_suits = ["\u2660", "\u2665", "\u2663", "\u2666"]

  deck_values = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, 
                "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 10, 
                "Q" => 10, "K" => 10, "A" => 11 }
               
  final_deck = []

  n.times do
    deck_values.each do | key, val |
      deck_suits.each do | suit |
        final_deck << [(key + suit), val]
      end
    end
  end
  final_deck
end

def shuffle(deck)
  puts "Shuffling..."
  sleep(1)
  3.times {deck.shuffle!}
  puts "Deck shuffled!"
end

end

#include Deck

#deck = deck_create(2)

#print deck


 

             
             
             
             
             
             
             
             