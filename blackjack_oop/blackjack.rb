require 'pry'
require './deck.rb'
require './player.rb'
require './dealer.rb'

class Blackjack

include Deck

$game_deck = nil

  def new
  end


  def new_deck
    puts "How many decks are we playing with?"   # need to add some logic to limit number of decks
    decks = gets.chomp
    $game_deck = deck_create(decks.to_i)
    puts "The shoe has been filled with #{decks} decks."
  end

  def run
  
    test = Player.new
    dealer = Dealer.new
    new_deck
    shuffle($game_deck)

    puts test.player_balance
   
    test.player_bet
   
    2.times do
      test.player_deal
      dealer.player_deal
    end
   
    dealer.player_hand_display
    
    test.player_hand_display
    
    test.player_decision
    
    dealer.dealer_active = true

    dealer.player_decision
    
    if test.player_value == 21 && test.player_hand.length == 2
      puts "\nBLACKJACK! You win 2x your bet!"
      sleep(0)
      player_winnings = test.bet_amount * 2
      test.player_balance += player_winnings
      puts "You've won #{player_winnings} - your new balance is: #{test.player_balance}"
    elsif test.player_value > 21
      puts "\nYou've busted!  Dealer wins."
      test.player_balance -= test.bet_amount
      puts "Your new balance is #{test.player_balance}."
    elsif dealer.player_value > 21
      puts "\nDealer has busted.  You win!"
      test.player_balance += test.bet_amount
      puts "Your new balance is #{test.player_balance}."
    elsif dealer.player_value > test.player_value
      puts "\nDealer wins!"
      test.player_balance -= test.bet_amount
      puts "Your new balance is #{test.player_balance}."
    elsif test.player_value > dealer.player_value
      puts "\nPlayer wins!"
      test.player_balance += test.bet_amount
      puts "Your new balance is #{test.player_balance}."
    else
      puts "\nIt's a push!"    
    end

    
  end
  
end

game = Blackjack.new

game.run

