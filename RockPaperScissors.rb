PLAYS = [:rock, :scissors, :paper]
WINSLOGIC = {rock: :scissors, scissors: :paper, paper: :rock}

class Player
  
  attr_accessor :nickname
  
  def self.new(nickname)
    #validates the player has a valid nickname or doesn't initialize the instance
    if !nickname.empty?
      super
    else
      return nil
    end
  end
  
  def initialize(nickname)
    @nickname = nickname
  end
  
end


class RockPaperScissors
  
  class TieClass
  end
  
  def self.new(p1, p2)
    #validates the game has two valid players or doesn't initialize the instance
    if p1.is_a?(Player) && p2.is_a?(Player)
      super
    else
      return nil
    end
  end
  
  def initialize(p1,p2)
    @p1 = p1
    @p2 = p2
  end
  
  def play(p1play,p2play)
    #validates both plays are valid plays
    if PLAYS.include?(p1play) && PLAYS.include?(p2play)
      if (p1play == p2play)
        #tie
        return TieClass
      elsif WINSLOGIC[p1play] == p2play
        #p1 wins
        return @p1
      else
        #p2 wins
        return @p2
      end
    else
    end
  end
  
end