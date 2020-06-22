class Volunteer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :activities
  has_many :volunteers, through: :participation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end