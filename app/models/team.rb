class Team < ActiveRecord::Base
	has_many :generators, dependent: :destroy
	has_many :superheroes, through: :generators
end
