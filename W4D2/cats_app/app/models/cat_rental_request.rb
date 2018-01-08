class CatRentalRequest < ApplicationRecord

  CAT_STATUS = %w(APPROVED DENIED PENDING).freeze

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: CAT_STATUS

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'Cat'

  def overlapping_requests
    0

  end
end
