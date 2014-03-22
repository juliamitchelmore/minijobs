class Job < ActiveRecord::Base
  attr_accessible :cost, :description, :duration, :image, :name

  has_and_belongs_to_many :adults

  has_many :kids, :through => :adult

end
