class QuestionsController < ApplicationController
    def index
        questions = Question.all
        # render json: questions: include: [:question_text, :correct_answer, :incorrect_answers]
        # render json: Question.all.to_json(:include => :question_text, :correct_answer, :incorrect_answers)
        render json: Question.all.to_json(:include => :user_questions)
    end
end

# class TrainersController < ApplicationController

#     def index
#         render json: Trainer.all.to_json(:include => :pokemons)
#     end

#     def show
#         trainer = Trainer.find(params[:id])

#         render json: trainer.to_json(:include => :pokemons)
#     end
# end