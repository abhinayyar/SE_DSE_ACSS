# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

competitions = [{:competition_name => 'Rookie', :competition_des => 'For rookie', :no_of_rounds => 3},
				{:competition_name => 'Ringman', :competition_des => 'For ringman', :no_of_rounds => 3},
				{:competition_name => 'Senior', :competition_des => 'For senior', :no_of_rounds => 3},
				{:competition_name => 'Champion', :competition_des => 'For champion', :no_of_rounds => 3}]
				

rounds = [{:round_name => 'First', :round_des => 'First round', :no_of_participants => 30},
    	  {:round_name => 'Interview', :round_des => 'Second round', :no_of_participants => 20},
    	  {:round_name => 'Final', :round_des => 'Third Round', :no_of_participants => 10}]

<<<<<<< HEAD
participants = [{:p_name => 'Anavil', :p_loc => 'India', :p_phone => 9249}, {:p_name => 'Kiran', :p_loc => 'India', :p_phone => 923249}], {:p_name => 'Ji', :p_loc => 'Chia', :p_phone => 23923249}]
users = [{:email_id => "admin", :password => "admin"},{:email_id => "judge", :password => "judge"}]

competitions.each do |competition|
	Competition.create!(competition)
=======
participants = [{:p_name => 'Anavil', :p_loc => 'India', :p_phone => 9249}, {:p_name => 'Kiran', :p_loc => 'India', :p_phone => 923249}], {:p_name => 'Ji', :p_loc => 'Chia', :p_phone => 23923249}

for k in 0..3
        Competition.create!(competitions[k])
        competitions[k].each do
                for i in 0..2
                        Round.create!(rounds[i])
                end
        end
>>>>>>> ab98a5d226951a1b80b31845c7307752916971ac
end
#competitions.each do |competition|
 #       Competition.create!(competition)
  #      rounds.each do|round,competition|                
   #                     Round.create!(round)
    #    end
#end

#rounds.each do |round|
#	Round.create!(round)
#end

participants.each do |participant|
	Participant.create!(participant)
end

users.each do |user|
	User.create!(user)
end
