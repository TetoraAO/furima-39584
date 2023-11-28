class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if (@item.user_id == current_user.id) || @item.record.present?
      redirect_to root_path
    end
    @purchase_record = PurchaseRecord.new
  end

  def create
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_record = PurchaseRecord.new(record_params)
    if @purchase_record.valid?
      pay_item
      @purchase_record.save
      redirect_to root_path
    else
      render :index,status: :unprocessable_entity
    end
  end

  private
  def record_params
    params.require(:purchase_record).permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: record_params[:token],
        currency: 'jpy'
      )
  end
end
