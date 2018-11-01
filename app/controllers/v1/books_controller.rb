class V1::BooksController < ApplicationController
  def index
    render json: BookQuery.new(params).collection.limit(50)
  end
end
