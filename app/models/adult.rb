class Adult < ActiveRecord::Base
  scope :all_parents, -> { where(type: 'parent') }
  scope :all_listers, -> { where(type: 'lister') }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :address, :email, :latitude, :longitude, :name

  has_many :jobs
  has_many :kids

  geocoded_by :address   # can also be an IP address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def parent?
    type == 'parent'
  end

  def adult?
    type == 'adult'
  end
end
