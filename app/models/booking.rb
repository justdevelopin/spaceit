class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates :starting_date, :end_date, presence: true
  validate :end_date_after_starting_date

  private

  def end_date_after_starting_date
    return if end_date.blank? || starting_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date <= starting_date
  end
end
