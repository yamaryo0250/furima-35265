class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, except: [:index, :new, :create]
  before_action :redirect, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
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
    redirect_to action: :index if @item.order.present?
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

  def redirect
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def item_params
    params.require(:item).permit(:image, :product, :genre_id, :text, :condition_id, :price, :charge_id, :area_id,
                                 :day_id).merge(user_id: current_user.id)
  end
end
