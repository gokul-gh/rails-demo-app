class PerformanceRating < ApplicationRecord
	belongs_to :student
	RATINGS = { 'Poor' => 1, 'Below Average' => 2, 'Average' => 3, 'Good' => 4, 'Excellent' => 5 }
end
