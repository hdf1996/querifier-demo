class V1::BooksController < ApplicationController
  def index
    render json: BookQuery.new(params).collection.limit(20).offset(params.fetch(:page, 1))
  end

  private

  def paginate(collection)
    collection.limit(20).offset(params.fetch(:page, 1).to_i * 20)
  end
end
