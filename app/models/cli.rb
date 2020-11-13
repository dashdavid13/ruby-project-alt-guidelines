require 'pry'
require 'tty-prompt'
require 'timers'


class CLI
   
       @@prompt = TTY::Prompt.new
       @@pastel = Pastel.new
       @@font = TTY::Font.new(:starwars)
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
            @@username = User.login
            self.game_menu
        elsif selection == "New User"
            @@username = User.new_user
        elsif selection == "Delete User"
            User.delete_user
        end
    end

    def self.game_menu
        sleep(1)
        system('clear')
        self.game_header
        prompt = TTY::Prompt.new
        
        selection = prompt.select("What action will you take?\n") do |option| 
            option.choice "New game"
            option.choice "High Scores"
        end
        if  selection == "New game"
           self.welcome
           system('clear')
        elsif selection == "High Scores"
            Jet.display_highscores
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
    
    
    