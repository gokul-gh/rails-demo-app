class CreateJoinTableAreaOfInterestStudent < ActiveRecord::Migration[6.1]
  def change
    create_join_table :area_of_interests, :students do |t|
      # t.index [:area_of_interest_id, :student_id]
      # t.index [:student_id, :area_of_interest_id]
    end
  end
end
