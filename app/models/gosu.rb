require 'gosu'
require 'pry'

class HeroesOfTheSky < Gosu::Window
   def initialize(jet1,jet2)
    #@jet1 = jet1
    #@jet2 = jet2
    super 640, 480
    self.caption = "Heroes Of The Sky"

    @background_image = Gosu::Image.new("media/sky.jpg", :tileable => true)

    @player_two = Player.new(jet2)
    @player = Player.new(jet1)
    @player.warp(350, 240)
    @player_two.warp(320, 240)
    
    @star_anim = Gosu::Image.load_tiles("media/star.png", 25, 25)
    @stars = Array.new
  end
  

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    elsif 
      Gosu.button_down? Gosu::KB_A or Gosu::button_down? Gosu::GP_LEFT
        @player_two.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    elsif 
      Gosu.button_down? Gosu::KB_D or Gosu::button_down? Gosu::GP_RIGHT
       @player_two.turn_right

    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
       @player.accelerate
    elsif 
      Gosu.button_down? Gosu::KB_W or Gosu::button_down? Gosu::GP_BUTTON_0
       @player_two.accelerate

    end
        @player.move
        @player_two.move
      something1 =  @player.collect_stars(@stars)
       something2 =  @player_two.collect_stars(@stars)
       puts
       if !something1 
         p @player.jet
       else
        puts "no stars collected. you lose. "
       end
       binding.pry
    if rand(100) < 4 and @stars.size < 25
      @stars.push(Star.new(@star_anim))
      end
    end 

    def draw
        @background_image.draw(0, 0, ZOrder::BACKGROUND)
        @player.draw
        @player_two.draw
        @stars.each { |star| star.draw }
    end

   

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

# in the CLI when they're ready to start playing call this 

# when we initialzie this can we pass in ids for the jets and game realted 