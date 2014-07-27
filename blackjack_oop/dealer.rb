class Dealer < Player

  attr_accessor :dealer_active, :name, :player_hand, :player_value

  def initialize
    @dealer_active = false
    @name = "Dealer"
    @player_hand = []
    @player_value = 0
   
  end
  
  def player_bet
    puts "Dealers don't make bets!"
  end
  
  def dealer_active?
    if self.dealer_active
      true
    end
  end
  
  def player_hand_display
    if dealer_active?
      print "#{self.name} hand - "
      self.player_hand.each do |sub_array|
      print sub_array.first + " / "
      end
      puts "or #{self.player_hand_value}"
    else
      puts "#{self.name} is showing #{self.player_hand.last.first}."
    end
  end
    
  def player_decision
    if @@player_busts == @@players
      puts "All players have busted!  Dealer does nothing."
    else
      self.player_hand_value
      puts "#{self.name} turns over a #{self.player_hand.first.first}."
      until self.player_value > 16
        puts "#{self.name} has #{self.player_value}. #{self.name} must hit!"
        self.player_deal
        self.player_hand_value
        self.player_hand_display
      end
      if self.player_value <= 21
        puts "#{self.name} has #{self.player_value}.  #{self.name} will stay."
      else 
        puts "#{self.name} has busted!"
      end
    end
  end
  
end