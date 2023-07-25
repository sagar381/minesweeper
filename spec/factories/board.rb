FactoryBot.define do
    factory :board do
      email { Faker::Internet.email }
      rows { rand(5..10) }
      cols { rand(5..10) }
      mines { Array.new(rand(5..10)) { [rand(0..4), rand(0..4)] } }
    end
end