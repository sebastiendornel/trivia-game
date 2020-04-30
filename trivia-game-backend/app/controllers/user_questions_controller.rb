class UserQuestionsController < ApplicationController
    def index
        user_questions = UserQuestion.all
        # render json: user_questions: include: [:points, :user_id, :question_id]
        # options = {}
        # options[:include] = [:user, :question]
        render json: UserQuestion.all.to_json(:include => [:user, :question])
    end
end

