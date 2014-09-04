class Player
  
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Game

  attr_accessor :players

  def initialize
    @players = []
  end

  def add(player)
    @players << player unless players.count == 2
  end

  def player_identified_with(id)
    @players.select do |player| 
      player.object_id == id.first
    end
  end
end
