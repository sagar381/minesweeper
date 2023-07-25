# spec/models/board_spec.rb
require 'rails_helper'
require 'faker'

RSpec.describe Board, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      board = Board.new(
        email: Faker::Internet.email,
        mines: Faker::Number.within(range: 1..100),
        rows: Faker::Number.within(range: 1..50),
        cols: Faker::Number.within(range: 1..50)
      )
      expect(board).to be_valid
    end

    it "is invalid without an email" do
      board = Board.new(
        mines: Faker::Number.within(range: 1..100),
        rows: Faker::Number.within(range: 1..50),
        cols: Faker::Number.within(range: 1..50)
      )
      expect(board).not_to be_valid
    end

    it "is invalid with an invalid email format" do
      board = Board.new(
        email: "invalid_email",
        mines: Faker::Number.within(range: 1..100),
        rows: Faker::Number.within(range: 1..50),
        cols: Faker::Number.within(range: 1..50)
      )
      expect(board).not_to be_valid
    end

    it "is invalid without mines" do
      board = Board.new(
        email: Faker::Internet.email,
        rows: Faker::Number.within(range: 1..50),
        cols: Faker::Number.within(range: 1..50)
      )
      expect(board).not_to be_valid
    end

    it "is invalid without rows" do
      board = Board.new(
        email: Faker::Internet.email,
        mines: Faker::Number.within(range: 1..100),
        cols: Faker::Number.within(range: 1..50)
      )
      expect(board).not_to be_valid
    end

    it "is invalid without cols" do
      board = Board.new(
        email: Faker::Internet.email,
        mines: Faker::Number.within(range: 1..100),
        rows: Faker::Number.within(range: 1..50)
      )
      expect(board).not_to be_valid
    end

    it "is invalid with non-integer mines" do
      board = Board.new(
        email: Faker::Internet.email,
        mines: Faker::Lorem.word,
        rows: Faker::Number.within(range: 1..50),
        cols: Faker::Number.within(range: 1..50)
      )
      expect(board).not_to be_valid
    end

    it "is invalid with non-integer rows" do
      board = Board.new(
        email: Faker::Internet.email,
        mines: Faker::Number.within(range: 1..100),
        rows: Faker::Lorem.word,
        cols: Faker::Number.within(range: 1..50)
      )
      expect(board).not_to be_valid
    end

    it "is invalid with non-integer cols" do
      board = Board.new(
        email: Faker::Internet.email,
        mines: Faker::Number.within(range: 1..100),
        rows: Faker::Number.within(range: 1..50),
        cols: Faker::Lorem.word
      )
      expect(board).not_to be_valid
    end
  end
end