class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Add :registerable to enable user registration
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
