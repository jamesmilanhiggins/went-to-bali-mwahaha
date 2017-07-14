# class Seed
  Product.destroy_all
  User.destroy_all
  # def self.begin
    # seed = Seed.new
    # seed.generate_products

    user = User.create(
      name: "Admin",
      email: "admin@gmail.com",
      password_digest: "password",
      admin: true
    )

  # end

  # def generate_products
    20.times do |i|
      Product.create!(name: Faker::Lorem.word,
                      price: rand(10...100),
                      description: Faker::Lorem.sentence(5, false, 0).chop,
                      image: Faker::Avatar.image)
    end
    5.times do |i|
      Order.create!(total_price: rand(10...100),
                      user_id: rand(1...20)
                    )
    end
#   end
# end

# Seed.begin
