class ItemsController < ApplicationController
  #before_action :authenticate_user!, except:[:index, :show]
  #before_action :move_to_index, only: [:edit, :update, :destroy]

  #def index
  #end

  #def new
    #@imet = Item.new
  #end

  #def creat
   # @imet = Item.new(item_params)
#    if @item.save
 #     redirect_to root_path
  #  else
   #   render :new
    #end
  #end

#  def destroy
#    @item = Item.find(params[:id])
 #   if @item.destroy
  #    redirect_to root_path
   # else
    #  redirect_to root_path
    #end
  #end

#  def move_to_index
 #   @item = Item.find(params[:id])
  #end

 # def edit
  #  redirect_to root_path 
  #end

  #def update
   # @item = Item.find(params[:id])
  #end

 # def show
  #  @item = Item.find(params[:id])
  #end

  #private

end
