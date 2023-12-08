class Remark < ApplicationRecord
  belongs_to :student
  validates :remark_detail, presence: true
end
