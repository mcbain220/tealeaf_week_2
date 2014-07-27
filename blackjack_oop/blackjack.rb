require 'pry'
require './deck.rb'
require './player.rb'
require './dealer.rb'

class Blackjack

include Deck

$game_deck = nil
@@decks = 0
@@game_active = 0

  def new
  end

  def new_deck
    puts "How many decks are we playing with? You can have up to eight:"   # need to add some logic to limit number of decks
      while @@decks == 0
        deck_response = gets.chomp
        if deck_response.to_i.is_a?(Integer) && deck_response.to_i <= 8
          @@decks = deck_response.to_i
          $game_deck = deck_create(@@decks)
          puts "The shoe has been filled with #{@@decks} decks."
        else
          puts "You must put in a valid number between 1 & 8."
        end
      end
  end

  def run
    
    system 'clear'
    
    @@game_active = 1
    
    player1 = Player.new
    dealer = Dealer.new
    new_deck
    shuffle($game_deck)

    while @@game_active == 1
       
      player1.player_bet
   
      2.times do
        player1.player_deal
        dealer.player_deal
      end
   
      dealer.player_hand_display
    
      player1.player_hand_display
    
      player1.player_decision
    
      dealer.dealer_active = true

      dealer.player_decision
    
      if player1.player_value == 21 && player1.player_hand.length == 2
        puts "\nBLACKJACK! You win 2x your bet!"
        sleep(0)
        player_winnings = player1.bet_amount * 2
        player1.player_balance += player_winnings
        puts "You've won #{player_winnings} - your new balance is: #{player1.player_balance}"
      elsif player1.player_value > 21
        puts "\nYou've busted!  Dealer wins."
        player1.player_balance -= player1.bet_amount
        puts "Your new balance is #{player1.player_balance}."
      elsif dealer.player_value > 21
        puts "\nDealer has busted.  You win!"
        player1.player_balance += player1.bet_amount
        puts "Your new balance is #{player1.player_balance}."
      elsif dealer.player_value > player1.player_value
        puts "\nDealer wins!"
        player1.player_balance -= player1.bet_amount
        puts "Your new balance is #{player1.player_balance}."
      elsif player1.player_value > dealer.player_value
        puts "\nPlayer wins!"
        player1.player_balance += player1.bet_amount
        puts "Your new balance is #{player1.player_balance}."
      else
        puts "\nIt's a push!"    
      end
      
      
      if player1.player_balance > 0
      
      puts "Would you like to play another hand? ( y / n )"
      continue = gets.chomp
          
        if continue == 'n'
          puts "Thank you for playing, #{player1.name}!"
          break
        else
          system 'clear'
          player1.clear
          dealer.clear
          if $game_deck.length < 20
            $game_deck = deck_create(@@decks)
            shuffle($game_deck)
          end
        end
      else
        puts "You've lost all your chips!  Game over."
        break
      end
    end    
  end
end

game = Blackjack.new

game.run

