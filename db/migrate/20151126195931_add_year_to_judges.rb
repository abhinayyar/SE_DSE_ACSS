class AddYearToJudges < ActiveRecord::Migration
  def change
    add_column :judges, :year_id, :integer, :default => 1
  end
end
