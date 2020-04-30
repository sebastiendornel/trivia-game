class Question < ApplicationRecord
    has_many :user_questions
    has_many :questions, through: :user_questions
end
