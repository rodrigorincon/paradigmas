class Api::BasicUnitsController < ApplicationController

  before_action :treat_page, :treat_limit

  DEFAULT_NUMBER_PER_PAGE = 10

  # GET /api/v1/find_ubs
  def find
    location = !params[:query].blank? ? params[:query] : nil

    if location
      lat_str, long_str = location.split(",")
      lat_min, lat_max, lat_less_comparator, lat_bigger_comparator = treat_location(lat_str)
      long_min, long_max, long_less_comparator, long_bigger_comparator = treat_location(long_str)
      
      @total = BasicUnit.search(lat_min, lat_max, lat_less_comparator, lat_bigger_comparator, 
        long_min, long_max, long_less_comparator, long_bigger_comparator).count

      @units = BasicUnit.search(lat_min, lat_max, lat_less_comparator, lat_bigger_comparator, 
        long_min, long_max, long_less_comparator, long_bigger_comparator).limit(@limit).offset(@page*@limit)
    else
      @total = BasicUnit.count
      @units = BasicUnit.all.limit(@limit).offset(@page*@limit)
    end

  end

  private

  def treat_location(coordinate_str)
    coordinate = coordinate_str.to_d
    positive = coordinate >= 0 ? true : false
    limit = limit_for_geolocation_search(coordinate_str)

    min = positive ? coordinate : (coordinate-limit)
    max = positive ? coordinate+limit : coordinate
    bigger_comparator = positive ? ">=" : ">"
    less_comparator = positive ? "<" : "<="

    [min, max, less_comparator, bigger_comparator]
  end

  def limit_for_geolocation_search(coord_str)
    num_decimal_places = coord_str.include?('.') ? coord_str.split('.').last.size : 0
    10**(-num_decimal_places)
  end

  def treat_page
    @page = !params[:page].blank? ? params[:page].to_i : 0
    if @page > 0 
      @page = @page - 1 
    elsif @page < 0 
      @page = 0 
    end
  end

  def treat_limit
    @limit = !params[:per_page].blank? ? params[:per_page].to_i : DEFAULT_NUMBER_PER_PAGE
    @limit = DEFAULT_NUMBER_PER_PAGE if @limit < 0
  end

end