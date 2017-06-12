class Api::V1::GroupsController < ApplicationController
    
    def create
    end
    def index
        render json: current_user.groups
    end
end
