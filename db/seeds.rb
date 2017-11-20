# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times{
    user = User.new(
        email: Faker::Internet.email,
        user_level: 9,
        # remote_profile_img_url: auth.info.image.gsub('http://','https://'),
        password: "admin"
      )    
    user.save
}