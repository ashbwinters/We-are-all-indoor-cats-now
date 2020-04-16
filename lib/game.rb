class Game < ActiveRecord::Base
    has_many :reviews
    has_many :players, through: :reviews
end