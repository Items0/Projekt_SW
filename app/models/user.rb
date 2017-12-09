class User < ApplicationRecord
      has_many :measurements
      has_secure_password

       validates :name,
      	presence: true,
      	length: {minimum:3, maximum: 25},
      	uniqueness: true

end
