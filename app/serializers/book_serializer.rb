class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :isbn, :publisher, :sinopsis
  
  belongs_to :author
end
