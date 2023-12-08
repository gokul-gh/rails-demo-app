class Department < ApplicationRecord
  belongs_to :college
  validates :name, :department_code, presence: true

  has_many :students, dependent: :destroy
end
