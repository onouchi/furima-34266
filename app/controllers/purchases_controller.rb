class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index]
  before_action :sold_out_item, only: [:index]

  def index
    
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def new
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    
    if @purchase_shipping_address.valid?
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :price, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end



  def pay_item

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    if Item.find(params[:item_id]).user.id == current_user.id
      redirect_to root_path
    end
  end

  def sold_out_item
    @item = Item.find(params[:item_id])
    redirect_to root_path  if @item.purchase.present? 
  end
end
