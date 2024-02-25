class SearchController < ApplicationController
  def index
    @location = params[:location]
    @query = params[:query]

    @rooms = Room.all
    @rooms = @rooms.where("name LIKE ? OR detail LIKE ?", "%#{@query}%", "%#{@query}%") if @query.present?
    @rooms = @rooms.where("address LIKE ?", "%#{@location}%") if @location.present?

    @total_count = @rooms.count
    @rooms = @rooms.page(params[:page])

    render "search/index"
  end
end
