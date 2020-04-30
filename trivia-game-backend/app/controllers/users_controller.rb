class UsersController < ApplicationController
    def index
        users = User.all
        # render json: users: include: [:name]
        render json: User.all.to_json(:include => :user_questions) #may not need the include clause
    end
ends




# class TrainersController < ApplicationController

#     def index
#         render json: Trainer.all.to_json(:include => :pokemons)
#     end

#     def show
#         trainer = Trainer.find(params[:id])

#         render json: trainer.to_json(:include => :pokemons)
#     end
# end
