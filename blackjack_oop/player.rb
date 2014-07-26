# blackjack_oop.rb - object oriented blackjack



class Player
  
  @@players = 0
  
  attr_accessor :name, :bet_amount, :player_hand, :player_value 
  attr_reader   :player_balance # I think player_balance may need to be private or protected
  
  def initialize
    puts "What is your name?"
    @name = gets.chomp
    @player_balance = 1000
    @player_hand = []
    @player_value = 0
    @bet_amount = 0
    @@players += 1
  end
  
  def player_bet
    while self.bet_amount == 0 
      puts "#{self.name}, how much would you like to bet?"
      amount = gets.chomp
      if amount.to_i.is_a?(Integer) && amount.to_i >0 && amount.to_i <= self.player_balance
        puts "OK #{self.name}, your bet is #{amount.to_i}."
        @bet_amount = amount.to_i
        #binding.pry
      else
        puts "Your bet must be a whole number between 1 and #{self.player_balance}."
      end
    end
  end
  
  def player_deal
    self.player_hand << $game_deck.shift
  end
  
  def player_hand_display
    print "#{self.name} hand - "
  self.player_hand.each do |sub_array|
    print sub_array.first + " / "
  end
  puts "or #{self.player_hand_value}"
  end
  
  def player_hand_value
    val_arr = []
    self.player_hand.each do |sub_array|
      val_arr << sub_array.last
      val_arr.sort!
    end
    val_arr.each do |val|
      if val == 11 && self.player_value > 10
        self.player_value +=1
      else 
        self.player_value += val
      end
    end
    self.player_value 
  end
  
  def player_decision
  end
  
  def player_resolve
  end
  
  
  
  def self.players
    puts @@players
  end
end

class Dealer < Player

# dealer class should re-write hand display & decision
  
end



