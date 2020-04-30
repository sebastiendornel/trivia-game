class QuestionsController < ApplicationController
    def index
        questions = Question.all
        render json: questions: include: [:question_text, :correct_answer, :incorrect_answers]
    end
end
