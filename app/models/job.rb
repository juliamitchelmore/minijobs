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

  def kid_applied?
    status == 'applied'
  end

  def parent_accepted?
    status == 'parent accepted'
  end

  def application_accepted?
    status == 'application accepted'
  end

end
