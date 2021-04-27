class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
  end

  def create
  end

  private

  # def item_params
  #   params.require(:item).permit(:image, :genre_id)
  # end
end
