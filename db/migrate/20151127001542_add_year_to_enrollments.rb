class AddYearToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :year_id, :integer, :default => 1
  end
end
