class Photo < ActiveRecord::Base
  attr_accessible :caption, :image, :integer, :user_id
  belongs_to :user
end
