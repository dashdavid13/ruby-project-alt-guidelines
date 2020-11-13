class Bullet
    attr_accessor :jet
    attr_reader :x, :y, :radius

SPEED = 5

    def initialize(window, x, y, angle, jet)
        @x = x
        @y = y
        @direction = angle
        @image = Gosu::Image.new("media/dot.png")
        @radius = 3
        @window = window
        @jet = jet 
    end

    def move
        @x += Gosu.offset_x(@direction, SPEED)
        @y += Gosu.offset_y(@direction, SPEED)
    end

    def draw
        @image.draw(@x - @radius, @y - @radius, 1)
    end

    #def hit_player 
       # (@x > @at_player.x - 25) && (@x < @at_player.x + 25) &&  (@y > @at_player.y - 50) && (@y < @at_player.y)
    #end   

end