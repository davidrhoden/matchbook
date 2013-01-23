class User < ActiveRecord::Base
  attr_accessible :city, :dob, :email, :name, :state
  has_many :photos
  has_many :profiles
end
