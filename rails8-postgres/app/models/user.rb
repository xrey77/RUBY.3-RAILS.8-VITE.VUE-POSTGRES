class User < ApplicationRecord
    has_secure_password    
    # has_one_attached :image

    validates :email, presence: true, uniqueness: { message: "is already taken." }  
    validates :username, uniqueness: true, uniqueness: { message: "is already taken." }      

end
