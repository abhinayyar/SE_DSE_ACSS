class AddYearToComments < ActiveRecord::Migration
  def change
    add_column :comments, :year_id, :integer, :default => 1
  end
end
