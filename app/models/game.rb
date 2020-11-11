class Game < ActiveRecord::Base
    has_many :jets
    has_many :users, through: :jets
end