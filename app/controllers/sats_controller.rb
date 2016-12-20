class SatsController < ApplicationController

  def index
    if params[:date]
      @sats = Sat
        .near(params[:address], 50)
        .where(date: Date.parse(params[:date]))
      puts "Found #{@sats.size} SATs on #{@sats.map(&:date).uniq}"
    end

    respond_to do |format|
      format.js {render json: @sats.map(&:attributes)}
      format.html {render :index}
    end
  end

end
