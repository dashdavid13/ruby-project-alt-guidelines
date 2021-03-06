require 'pry'

class User < ActiveRecord::Base
    has_many :jets
    has_many :games, through: :jets 
    @@prompt = TTY::Prompt.new

    def self.login
        username = @@prompt.ask("Please enter your name:")
        if  self.find_by(username: username)
            system('clear')
            self.find_by(username: username).password_check
        else
            self.user_dne
        end
    end

    def password_check
        system('clear')
        password = @@prompt.mask("Please enter your password:")
        if self.password == password
            self
        else
            puts "We're sorry, that password is incorrect."
            sleep(2)
            CLI.title_screen 
        end
    end

    def self.delete_user
        username = @@prompt.ask("Which user do you want to delete?")
        if self.find_by(username: username) 
            user = self.find_by(username: username).password_check
            if user
                # binding.pry
                User.destroy(user.id)
                system('clear')
                puts "\nYou are destroyed."
                sleep(2)
                CLI.title_screen
            else
                CLI.title_screen
            end
        else
            self.user_dne
        end
    end

    def self.user_dne
        puts "\nUser does not exist."
        sleep(2)
        CLI.title_screen    
    end 

end 