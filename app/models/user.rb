class User < ActiveRecord::Base
    has_many :jets
    has_many :games, through: :jets 

end 