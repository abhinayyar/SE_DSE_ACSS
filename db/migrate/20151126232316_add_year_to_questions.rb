class AddYearToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :year_id, :integer, :default => 1
  end
end
