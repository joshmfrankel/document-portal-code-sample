class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    teacher: "teacher",
    student: "student"
  }

  belongs_to :creator, class_name: :User, optional: true
  has_many :students, class_name: :User, foreign_key: :creator_id
end
