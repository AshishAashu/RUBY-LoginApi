class Apiuser < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    belongs_to :course, class_name: "Course"
    belongs_to :user, class_name: "User"
end
