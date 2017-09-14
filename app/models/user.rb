class User < ApplicationRecord
	has_secure_password    #used password_digest , not password

    validates :email, uniqueness: true

    #to save the the email in downcase in the database, if user has input in capital letter
    #or user has entered spaces in email
    def email=(value)
    	value = value.strip.downcase
    	write_attribute :email, value
    end
end
