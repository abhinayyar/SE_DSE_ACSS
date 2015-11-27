class AddYearToScores < ActiveRecord::Migration
  def change
    add_column :scores, :year_id, :integer, :default => 1
  end
end
