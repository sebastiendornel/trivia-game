class UsersController < ApplicationController
    def index
        users = User.all
        render json: users: include: [:name]
    end
end


