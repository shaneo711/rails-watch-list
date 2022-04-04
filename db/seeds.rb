# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

IMAGE_SIZE = 'w500'

puts 'Deleting database...'
Movie.destroy_all
puts 'Database deleted!'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies = URI.parse(url).open.read
movie_list = JSON.parse(movies)
image_base_url = "https://image.tmdb.org/t/p/#{IMAGE_SIZE}"

puts 'Creating movies...'
movie_list['results'].each do |movie|
  movie = Movie.new(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "#{image_base_url}#{movie['poster_path']}",
    rating: movie['vote_average']
  )
  movie.save
  puts "Movie #{movie.id} created."
end
puts 'Database seed complete.'
