class AddYearToCompetitionsJudges < ActiveRecord::Migration
  def change
    add_column :competitions_judges, :year_id, :integer, :default => 1
  end
end
