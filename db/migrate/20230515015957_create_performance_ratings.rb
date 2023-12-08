class CreatePerformanceRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :performance_ratings do |t|
      t.integer :student_id
      t.integer :rating
      t.integer :staff_id

      t.timestamps
    end
  end
end
