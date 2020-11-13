require 'pry'
require 'tty-prompt'
require 'timers'


class CLI
   
       @@prompt = TTY::Prompt.new
       @@pastel = Pastel.new
       @@font = TTY::Font.new(:starwars)
       @@current_game = nil 
       @@username1 = nil
       @@username2 = nil

    def self.username1=(username1)
        @@username1 = username1
    end

    def self.username2=(username2)
        @@username2 = username2
    end

    
    def self.title_screen
        system('clear')
        self.game_header #prints title screen
        @@username1 = nil
        @@username2 = nil
        self.auth_sequence
    end

    def self.game_header
        puts @@pastel.blue(@@font.write("Heroes Of The Sky!"))
    end

    def self.auth_sequence
        prompt = TTY::Prompt.new
        if @@username1 == nil 
            selection = prompt.select("\n\n\nChoose an option from the menu below (Player1):") do |option|
                option.choice "Log In"
                option.choice "New User"
                option.choice "Delete User"
            end
            
            if selection == "Log In"
                @@username1 = User.login
            elsif selection == "New User"
                #User.new_user1
                self.new_user1
            elsif selection == "Delete User"
                User.delete_user
            end
        end
        if @@username2 == nil 
            selection = prompt.select("\n\n\nChoose an option from the menu below (Player2):") do |option|
                option.choice "Log In"
                option.choice "New User"
                option.choice "Delete User"
            end
            
            if selection == "Log In"
                @@username2 = User.login
            elsif selection == "New User"
                #User.new_user2
                self.new_user2
            elsif selection == "Delete User"
                User.delete_user
            end
        end
        puts


        self.game_menu
    end

    def self.new_user1 
        username = @@prompt.ask("Enter your name:")
        password = @@prompt.mask("Enter a password:")
        confirm_password = @@prompt.mask("Confirm your password:")
        
        if password != confirm_password
            puts "Passwords do not match. Re-enter your information."
            system('clear')
            self.new_user1
        else
            user_hold = User.create(username: username, password: password)
            #self.find_by(username: username)
            # puts self
            # CLI.username1 = self
            puts "\n #{username} has been created."
            system('clear')
            sleep(1)
            @@username1 = user_hold
        end 
    end

    def self.new_user2
        username = @@prompt.ask("Enter your name:")
        password = @@prompt.mask("Enter a password:")
        confirm_password = @@prompt.mask("Confirm your password:")
        
        if password != confirm_password
            puts "Passwords do not match. Re-enter your information."
            system('clear')
            self.new_user2
        else
            user_hold = User.create(username: username, password: password)
            #self.find_by(username: username)
            # CLI.username2 = self
            puts "\n #{username} has been created."
            system('clear')
            sleep(1)
            @@username2 = user_hold
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
        game = Game.create
        jet1 = Jet.create
        jet2 = Jet.create
        jet1.user = @@username1
        jet2.user = @@username2
        # puts jet1
        HeroesOfTheSky.new(jet1,jet2).show
        jet1.save
        jet2.save
        system("clear")
        #SOMETHING TO INTRODUCE OUR GAME
        #puts @pastel.bold(@font.write("Heroes Of The Sky"))
    end
end 
    
    
    