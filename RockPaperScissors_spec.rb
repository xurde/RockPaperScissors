require "./RockPaperScissors"

describe Player, "#new" do
  
  it "returns nil for a non valid player nickname" do
    Player.new("").should be_nil
  end
  
  it "returns a Player for a valid player nickname" do
    Player.new("Xurde").should be_instance_of(Player)
  end
  
end


describe RockPaperScissors, "#new" do
  
  it "returns nil for a non valid game" do
    RockPaperScissors.new(Player.new("Fulanito"), Player.new("")).should be_nil
  end
  
  it "returns a RockPaperScissors for a valid game" do
    RockPaperScissors.new(Player.new("Fulanito"), Player.new("Menganito")).should be_instance_of(RockPaperScissors)
  end
  
end


game = RockPaperScissors.new(Player.new("Fulanito"), Player.new("Menganito"))

describe RockPaperScissors, "#play" do
  
  it "returns nil for a non valid play" do
    game.play(:rock, :potato).should be_nil
  end
  
  it "returns nil for a non valid play" do
    game.play(:rock, :potato).should be_nil
  end
  
  it "returns a Player for a valid play" do
    game.play(:rock, :paper).should be_instance_of(Player)
  end
  
  it "returns a RockPaperScissors::TieClass for a tie play" do
    game.play(:rock, :rock).should be(RockPaperScissors::TieClass)
  end
  
  it "returns Player(Fulanito) as a winner" do
    game.play(:paper, :rock).should satisfy{|p| p.nickname == "Fulanito"}
  end
  
  it "returns Player(Menganito) as a winner" do
    game.play(:rock, :paper).should satisfy{|p| p.nickname == "Menganito"}
  end
  
end