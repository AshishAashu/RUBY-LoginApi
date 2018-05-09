class Course < ApplicationRecord
    has_many :apiusers, class_name: "Apiusers"
end
