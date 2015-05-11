class ThingsController < ApplicationController
  def index
    @things = Thing.page(params[:page]).per(10)
    if(params[:order])
      @things = @things.order_by(params[:order])
    end

    #sleep 0.5

    render partial: 'table', layout: false if request.xhr?
  end

  def show
    @thing = Thing.find(params[:id])
  end
end
