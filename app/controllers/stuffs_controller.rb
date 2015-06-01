class StuffsController < ApplicationController
  def index
    @stuffs = Stuff.page(params[:page]).per(10)
    if(params[:order])
      @stuffs = @stuffs.order_by(params[:order])
    end

    render partial: 'table', layout: false if request.xhr?
  end

  def show
    @stuff = Stuff.find(params[:id])
  end
end
