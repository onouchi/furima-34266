class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_, only: [:show, :edit, :update]
  

  def index
    @items = Item.order(created_at: :desc) 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show 
  end
  
  def edit 
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :price, :delivery_charged_id, :category_id, :product_condition_id,
                                 :prefecture_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless Item.find(params[:id]).user.id.to_i == current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
