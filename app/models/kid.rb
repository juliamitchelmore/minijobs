class Kid < ActiveRecord::Base
  scope :created_today, -> { where('created_at > ?', Date.today.beginning_of_day) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :username
  attr_accessible :name

  belongs_to :adult
  has_many :jobs, :through => :adult

  def lat_long
    [adult.latitude, adult.longitude]
  end

  def parent
    Adult.parent.first
  end

  def jobs
    parent.jobs
  end

end
