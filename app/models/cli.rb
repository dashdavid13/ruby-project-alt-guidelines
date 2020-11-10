require 'pry'
require 'tty-prompt'


class CLI
   
       @@prompt = TTY::Prompt.new
       @@font = TTY::Font.new
       @@pastel = Pastel.new
       @@font = TTY::Font.new(:doom)
       @@current_game = nil 
       @@username = nil 

    def self.username=(username)
        @@username = username
    end
    
    
    def self.title_screen
        system('clear')
        self.game_header #prints title screen
        self.auth_sequence
    end

    def self.game_header
        puts @@pastel.blue(@@font.write("Heroes Of The Sky!"))
    end

    def self.auth_sequence
        prompt = TTY::Prompt.new

        selection = prompt.select("\n\n\nChoose an option from the menu below:") do |option|
            option.choice "Log In"
            option.choice "New User"
            option.choice "Delete User"
        end
        
        if selection == "Log In"
            @@user = User.login
            self.game_menu
        elsif selection == "New User"
            @@user = User.new_user
        elsif selection == "Delete User"
            User.delete_user
        end
    end

    def self.game_menu
        sleep(1)
        system('clear')
        self.game_header
        prompt = TTY::Prompt.new
        
        selection = prompt.select("What action will you take?\n") do |option| #change prompt
            option.choice "New game\n"
            option.choice "High Scores"
            
        if selection == "New game\n"
           self.welcome
             #@@current_game = HeroesOfTheSky.new(jet1,jet2,user_id: @@username.id, game_complete: false).show
                
            elsif selection == "High Scores"
                 Game.display_highscores
                 # self.title_screen
            end
        end

      

    end

    


    
    def self.welcome 
        
        jet1 = Jet.first
        jet2 = Jet.second
        HeroesOfTheSky.new(jet1,jet2).show
        system("clear")
        #SOMETHING TO INTRODUCE OUR GAME
        #puts @pastel.bold(@font.write("Heroes Of The Sky"))

    end
end 
    
    
    