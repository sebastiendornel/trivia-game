class UserQuestionsController < ApplicationController
    def index
        user_questions = UserQuestion.all
        render json: user_questions: include: [:points, :user_id, :question_id]
    end
end

# asdfasfd
# asdfsdfsdf