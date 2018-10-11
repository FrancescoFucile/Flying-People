class LocalityController < ApplicationController
  def show
    puts params[:name]
    @locality_name = params[:name]
  end
end
