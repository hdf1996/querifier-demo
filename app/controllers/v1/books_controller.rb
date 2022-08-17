class V1::BooksController < ApplicationController
  def index
    render json: paginate(BookQuery.new(params).collection)
  end

  private

  # This could've been done with gems like Kaminari or anything that works
  # with an ActiveRecord relation. 
  # We just wanted to keep this repository low on external dependencies
  def paginate(collection)
    collection.limit(20).offset(page * 20)
  end

  def page
    page_number = [params.fetch(:page, 1).to_i, 1].max
    page_number - 1
  end
end
