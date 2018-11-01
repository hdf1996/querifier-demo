class BookQuery
  include Querifier::Queries::Default

  # If no order param is provided, then this order will be used
  # default_sort { id: :asc }
  # Configure these constants to add attributes to the ordering a filtering
  where_attributes :id, :title, :publisher, :isbn, :author_name
  order_attributes :id, :title, :isbn, :author_name

  def filter_by_author_name(name)
    @collection = @collection.join(:author).where(authors: { name: name })
  end

  def order_by_author_name(direction)
    @collection = @collection.joins(:author).order("authors.name #{direction}")
  end
end
