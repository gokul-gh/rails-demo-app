class Student < ApplicationRecord
  belongs_to :department
  belongs_to :college
  has_many :remarks, dependent: :destroy
  has_and_belongs_to_many :area_of_interests
  has_many :performance_ratings, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  accepts_nested_attributes_for :area_of_interests

  validates :name, :date_of_birth, :roll_no, presence: true

  scope :filter_student,->(from = Date.yesterday, to= Date.today){where(date_of_birth:from..to)}

  before_create :add_prefix

  def group_by_rating
    performance_ratings.group(:rating).count
  end

  private

  def add_prefix
    self.roll_no.prepend("#{self.department.department_code}_")
  end
end
