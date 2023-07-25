class Board < ApplicationRecord
  validates :email, presence: true, length: { maximum: 50 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :rows, :cols, presence: true, numericality: { only_integer: true }
  validates :mines, presence: true

  scope :last_ten_records, -> { order(created_at: :desc).limit(10) }
end