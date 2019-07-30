class ListController < ApplicationController
  
    def index
      @lists = current_user.list
    end  
  
    def show
      @list = List.find(params[:id])
    end  
  
  end  