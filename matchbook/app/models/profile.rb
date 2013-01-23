class Profile < ActiveRecord::Base
  attr_accessible :band, :description, :user_id
  belongs_to :user
end
