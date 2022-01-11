class ItemsController < ApplicationController

#  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
   @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

#  def destroy
#    @items = Item.find(params[:id])
#    if @items.destroy
#     redirect_to root_path
 #   else
#      redirect_to root_path
#    end
#  end

#  def move_to_index
#    @items = Item.find(params[:id])
#  end

#  def update
#    @items = Item.find(params[:id])
#  end

  private
  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :derivery_charge_id, :scheduled_delivery_id, :area_id, :price, :image).merge(user_id: current_user.id)
  end

end
