class V1::BooksController < ApplicationController
  def index
    render json: paginate(BookQuery.new(params).collection)
  end

  private

  def paginate(collection)
    collection.limit(20).offset([params.fetch(:page, 0).to_i, 0].max * 20)
  end
end
