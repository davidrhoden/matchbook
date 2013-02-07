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
  attr_accessor :password
  attr_accessible :date_joined, :birthdate, :city, :color, :email, :first_name, :gender, :last_name, :state, :username, :zipcode, :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username, :presence => true,
                       :length => { :maximum => 50 }
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :password, :confirmation => true,
                       :presence => true,
                       :length => { :within => 6..40 }
                       
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  private
  
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end
  
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
