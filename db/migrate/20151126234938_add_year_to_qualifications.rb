class AddYearToQualifications < ActiveRecord::Migration
  def change
    add_column :qualifications, :year_id, :integer, :default => 1
  end
end
