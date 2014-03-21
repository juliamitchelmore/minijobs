class Job < ActiveRecord::Base
  attr_accessible :cost, :description, :duration, :image, :name
end
