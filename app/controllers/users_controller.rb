class UsersController < ApplicationController
  def index
    @users = User.all

    render json: { 
      users: UserSerializer.new(@users).serializable_hash[:data].map{|user| user[:attributes]}.filter{|user| user[:id] != 1},
      current_user: current_user.id
    }
  end
end
