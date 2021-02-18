class User < ApplicationRecord
    before_save {self.email = email.downcase}
    has_secure_password
    has_many :events, dependent: :destroy

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    #validates :email, presence: true, uniqueness: true, length: { maximum: 75 }, format: { with: VALID_EMAIL_REGEX }
    validates :email, presence: true, confirmation: true,
                    length: { maximum: 75 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates_presence_of :name
    validates_presence_of :email_confirmation
    

end
