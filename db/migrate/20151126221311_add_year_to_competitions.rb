class AddYearToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :year_id, :integer, :default => 1
  end
end
