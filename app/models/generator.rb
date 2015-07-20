class Generator < ActiveRecord::Base
  belongs_to :superhero
  belongs_to :team
end
