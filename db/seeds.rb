# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleteing all users"
User.destroy_all

puts "deleteing all genres"
Genre.destroy_all

puts "deleting all artists"
Artist.destroy_all

puts "deleting all albums"
Album.destroy_all

puts "deleting all songs"
Song.destroy_all

puts "deleting all reviews"
Review.destroy_all

puts "creating user"
5.times do
  User.create!(
    username: Faker::Name.name,
    bio: Faker::TvShows::Simpsons.quote,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(number: 6)
    )
end


puts "createing genres"

5.times do
  Genre.create!(genre_name: Faker::Music.genre)
end

puts "creating artists"

Genre.all.each do |g|
  6.times do
    Artist.create!(
      name: Faker::Music.band,
      genre_id: g.id,
      user_id: User.all.sample.id
      )
  end
end

puts "creating albums"

Artist.all.each do |a|
  5.times do
    Album.create!(
      title: Faker::Music.album,
      user_id: User.all.sample.id,
      artist_id: a.id,
      genre_id: a.genre_id
      )
  end
end

puts "creating songs"

Album.all.each do |a|
  10.times do
    Song.create!(
      title: Faker::Lorem.words(number: rand(3)),
      artist_id: a.artist_id,
      album_id: a.id,
      )
  end
end

puts "creating reviews"

Album.all.each do |a|
  10.times do
    Review.create!(
      content: Faker::Quote.famous_last_words,
      user_id: User.all.sample.id,
      album_id: a.id
    )
  end
end

puts "finished!"
