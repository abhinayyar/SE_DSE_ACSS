class AddYearToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :year_id, :integer, :default => 1
  end
end
