class Api::V1::LearningResourcesController < ApplicationController
  def index
    results = VideoSearchFacade.new(params).videos
    render json: results
  end
end