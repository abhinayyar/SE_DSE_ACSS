class AddYearToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :year_id, :integer, :default => 1
  end
end
