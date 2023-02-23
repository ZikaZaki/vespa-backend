# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a regular user.
User.create!(
    username: "test",
    email: "test@gmail.com",
    password: "test123",
    password_confirmation: "test123",
    admin: false
)

# Create admin user.
User.create!(
    username: "admin",
    email: "admin@gmail.com",
    password: "admin123",
    password_confirmation: "admin123",
    admin: true
)

Reservation.create!(
    user_id: 8,
    city_id: 12,
    motorcycle_id: 3,
    reserve_date: "2021-05-01",
    returning_date: "2021-05-05"
)

Reservation.create!(
    user_id: 8,
    city_id: 13,
    motorcycle_id: 3,
    reserve_date: "2021-05-01",
    returning_date: "2021-05-05"
)

Reservation.create!(
    user_id: 8,
    city_id: 13,
    motorcycle_id: 6,
    reserve_date: "2021-05-01",
    returning_date: "2021-05-05"
)

Reservation.create!(
    user_id: 8,
    city_id: 12,
    motorcycle_id: 6,
    reserve_date: "2021-05-01",
    returning_date: "2021-05-05"
)

Reservation.create!(
    user_id: 10,
    city_id: 13,
    motorcycle_id: 7,
    reserve_date: "2021-05-01",
    returning_date: "2021-05-05"
)

Reservation.create!(
    user_id: 10,
    city_id: 14,
    motorcycle_id: 7,
    reserve_date: "2021-05-01",
    returning_date: "2021-05-05"
)