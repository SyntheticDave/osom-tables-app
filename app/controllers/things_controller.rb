class ThingsController < ApplicationController
  def index
    @things = Thing.page(params[:page]).per(10)
    if(params[:order])
      @things = @things.order_by(params[:order])
    end

    render partial: 'table', layout: false if request.wiselinks_partial?
  end

  def show
    @thing = Thing.find(params[:id])
  end
end
