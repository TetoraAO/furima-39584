class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new,status: :unprocessable_entity
    end
  end

  def show
    
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
    if user_signed_in? && @item.record.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit,status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user_id == current_user.id
      if @item.destroy
        redirect_to root_path
      else
        render :show,status: :unprocessable_entity
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_charge_id, :region_id, :delivery_date_id, :price, ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end