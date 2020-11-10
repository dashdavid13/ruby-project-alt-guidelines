require 'pry'
require 'tty-prompt'
class Cli
    def initialize
       @prompt = TTY::Prompt.new
       @font = TTY::Font.new
       @pastel = Pastel.new
    end

    def welcome 
        system("clear")
        #SOMETHING TO INTRODUCE OUR GAME
        #puts @pastel.bold(@font.write("Heroes Of The Sky"))

    end
  
    binding.pry 
end



