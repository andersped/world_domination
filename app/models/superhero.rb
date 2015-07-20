class Superhero < ActiveRecord::Base
	has_many :generators, dependent: :destroy
	has_many :teams, through: :generators
end
