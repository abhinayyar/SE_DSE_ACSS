class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
	t.string :competition_name
	t.text :competition_des
	t.timestamps null: false
    end 
  end
end
