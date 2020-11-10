require 'pry'
require 'tty-prompt'
class CLI
    def initialize
       @prompt = TTY::Prompt.new
       @font = TTY::Font.new
       @pastel = Pastel.new
    end

    def welcome 
        jet1 = Jet.first
        jet2 = Jet.second
        HeroesOfTheSky.new(jet1,jet2).show
        # system("clear")
        #SOMETHING TO INTRODUCE OUR GAME
        #puts @pastel.bold(@font.write("Heroes Of The Sky"))

    end
  
    
end



