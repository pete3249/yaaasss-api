class UsersController < ApplicationController
  def index
    @users = User.all

    render json: UserSerializer.new(@users).serializable_hash[:data].map{|user| user[:attributes]}.filter{|user| user[:id] != 1}
  end
end
