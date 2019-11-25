class RecommendedSearchesController < ApplicationController
  def new
    @recommended_search = RecommendedSearch.new
  end

  def create
    @recommended_search = RecommendedSearch.create!(recommended_search_params)
    @recommended_search.save
    
    redirect_to @recommended_search
  end

  def show
    @recommended_search = RecommendedSearch.find(params[:id])
  end

  
  private
  def recommended_search_params
    params.require(:recommended_search).permit(:lowest_cost, :cost_benefit,
                                               :lower_weight, :lower_size, :keyword, 
                                               :structure_type)
  end

end
