class Adult < ActiveRecord::Base
  scope :all_parents, -> { where(role: 'parent') }
  scope :all_listers, -> { where(role: 'lister') }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :address, :email, :latitude, :longitude, :name

  has_and_belongs_to_many :jobs
  has_many :kids

  geocoded_by :address   # can also be an IP address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def parent?
    role == 'parent'
  end

  def adult?
    role == 'adult'
  end

  def kid
    kids.first
  end
end
