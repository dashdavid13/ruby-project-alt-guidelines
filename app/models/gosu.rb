require 'gosu'
require 'pry'

class HeroesOfTheSky < Gosu::Window
   def initialize(jet1,jet2)
    @jet1 = jet1
    @jet2 = jet2
    super 640, 480
    self.caption = "Heroes Of The Sky"

    @background_image = Gosu::Image.new("media/sky.jpg", :tileable => true)

    @player_two = Player.new(jet2)
    @player = Player.new(jet1)
    @player.warp(350, 240)
    @player_two.warp(320, 240)
    
    @star_anim = Gosu::Image.load_tiles("media/star.png", 25, 25)
    @stars = Array.new
    @font = Gosu::Font.new(20)

    @bullets = []
  end
  

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_A or Gosu::button_down? Gosu::GP_LEFT
        @player_two.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_D or Gosu::button_down? Gosu::GP_RIGHT
       @player_two.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
       @player.accelerate
    end 
    if Gosu.button_down? Gosu::KB_W or Gosu::button_down? Gosu::GP_BUTTON_0
       @player_two.accelerate
    end

        @player.move
        @player_two.move
        something1 =  @player.collect_stars(@stars)
        something2 =  @player_two.collect_stars(@stars)

       # hit1 = @player.collision(@bullets)
        #hit2 = @player_two.collision(@bullets)
     
    if rand(100) < 4 and @stars.size < 25
      @stars.push(Star.new(@star_anim))
      end

      @bullets.each { |bullet| bullet.move }
    end 

    def draw
        @background_image.draw(0, 0, ZOrder::BACKGROUND)
        @player.draw
        @player_two.draw
        @stars.each { |star| star.draw }
        @font.draw_text("Player One Score: #{@player.score}",10,10,ZOrder::UI, 1.0, 1.0, Gosu::Color::RED)
        @font.draw_text("Player Two Score: #{@player_two.score}",10,50,ZOrder::UI, 1.0, 1.0, Gosu::Color::RED)
        @bullets.each { |bullet| bullet.draw }
      end

   

  def button_down(id)
    if id == Gosu::KbSpace 
    @bullets.push Bullet.new(@self, @player.x, @player.y, @player.angle, @jet1)
   end
   if id == Gosu::KB_Q
    @bullets.push Bullet.new(@self, @player_two.x, @player_two.y, @player_two.angle, @jet2)
   end 
   if id == Gosu::KB_ESCAPE 
     @jet1.user_score = @player.score
     @jet2.user_score = @player_two.score

     close
   else
    super
   end 
  end 

end

# in the CLI when they're ready to start playing call this 

# when we initialzie this can we pass in ids for the jets and game realted 