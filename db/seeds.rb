40.times do
  Author.create(
    name: FFaker::Book.author
  )
end

500.times do
  Book.create(
    author: Author.all.sample,
    isbn: FFaker::Book.isbn,
    title: FFaker::Book.title,
    publisher: FFaker::Company.name,
    sinopsis: FFaker::Book.description
  )
end
