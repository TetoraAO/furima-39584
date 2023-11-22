class OrdersController < ApplicationController

  def index
    @purchase_record = PurchaseRecord.new
  end

  def create
    @purchase_record = PurchaseRecord.new(record_params)
    if @purchase_record.valid?
      @purchase_record.save
      redirect_to action: root_path
    else
      render action: :index
    end
  end

  private
  def record_params
    params.require(:purchase_record).permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id)
  end

end
