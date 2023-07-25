require 'faker'

20.times do
  Board.create!(
    email: Faker::Internet.email,
    mines: Array.new(3) { Faker::Number.between(from: 1, to: 20) }, # An array of 3 random numbers
    rows: Faker::Number.between(from: 1, to: 50),
    cols: Faker::Number.between(from: 1, to: 50)
  )
end
