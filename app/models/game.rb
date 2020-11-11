class Game < ActiveRecord::Base
    has_many :jets
    has_many :users, through: :jets

   #def self.display_highscores
   #top_scores = self.all.max_by(5) { |game| game.high_scores}
   #user_ids = top_scores.map { |game| game.user_id }
   #players = user_ids.map { |id| User.find(id).name}
   #scores = top_scores.map {game| game.high_scores}
   #puts "HIGH SCORES"
   #index = 0
   #while index < 5
   #puts "#{index = 1}. #{players[index]}:  #{scores[index]}"
   #index += 1
   #end

end