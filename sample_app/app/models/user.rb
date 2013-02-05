# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  email      :string(255)
#  birthdate  :date
#  first_name :string(255)
#  last_name  :string(255)
#  zipcode    :integer
#  city       :string(255)
#  state      :string(255)
#  color      :string(255)
#  gender     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :birthdate, :city, :color, :email, :first_name, :gender, :last_name, :state, :username, :zipcode
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username, :presence => true,
                       :length => { :maximum => 50 }
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
end
