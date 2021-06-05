class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc) 
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

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :price, :delivery_charged_id, :category_id, :product_condition_id,
                                 :prefecture_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end
end
