class Job < ActiveRecord::Base
  attr_accessible :cost, :description, :duration, :image, :name

  has_and_belongs_to_many :adults

  has_many :kids, :through => :adult

  def lister
    adults.all_listers.first
  end

  def parent
    adults.all_parents.first
  end

  def kids
    parent.present? ? [parent.kid] : []
  end

end
