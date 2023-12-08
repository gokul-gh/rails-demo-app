class College < ApplicationRecord
    validates :name, presence: true
    has_many :departments, dependent: :destroy
    has_many :staffs, dependent: :destroy
end
