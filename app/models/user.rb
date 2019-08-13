class User < ApplicationRecord
	validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "L'adresse email est incorrect" }

	validates :password, 
	presence: true, 
	length: { minimum: 6 }

	belongs_to :city

	has_many :gossips
	has_many :comments

	has_secure_password
end
