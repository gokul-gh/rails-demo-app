class AddCollegeIdToStaffs < ActiveRecord::Migration[6.1]
  def change
    add_column :staffs, :college_id, :integer
  end
end
