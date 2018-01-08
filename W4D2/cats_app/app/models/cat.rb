class Cat < ApplicationRecord

  include ActionView::Helpers::DateHelper

  CAT_COLORS = %w(black white orange brown).freeze

  validates :color, inclusion: CAT_COLORS
  validates :sex, inclusion: ["M", "F"]
  validates :birth_date, :color, :sex, :name, presence: true

  has_many :cat_rentals, dependent: :destroy
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'CatRentalRequest'

  def age
    time_ago_in_words(birth_date)
  end

end
