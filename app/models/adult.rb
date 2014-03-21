class Adult < ActiveRecord::Base
  attr_accessible :address, :email, :latitude, :longitude, :name
end
