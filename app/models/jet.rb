class Jet < ActiveRecord::Base
    belongs_to :user
    belongs_to :game

    def self.display_highscores
        top_scores = self.all.max_by(5) { |jet| jet.user_score }
        user_ids = top_scores.map { |jet| jet.user_id }
        players = user_ids.map { |id| User.find(id).username }
        scores = top_scores.map { |jet| jet.user_score}
        system('clear')
        puts "HIGH SCORES"
        i = 0
        while i < 5
            puts "#{i + 1}. #{players[i]}: #{scores[i]}" #add player2 inside here?
            i += 1
        end

        prompt = TTY::Prompt.new 

        selection = prompt.select("Would you like to:") do |option|
            option.choice "Return to Game Menu"
            option.choice "Logout"
        end

        if selection == "Return to Game Menu"
            CLI.game_menu
        elsif selection == "Logout"
            CLI.title_screen
        end
    end




end