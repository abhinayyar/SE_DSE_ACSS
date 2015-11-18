class ParticipantsController < ApplicationController
	before_filter :check_authentication

def check_authentication
	if session[:user_type] == nil
		flash[:notice] = 'Select one of the methods'
		redirect_to root_path
	end

end
def participant_params
	params.require(:participant).permit(:p_name, :p_loc, :p_phone, :p_email, :p_des, :password)
end

def index
	@participant_count=Participant.count
	@participants = Participant.all.limit(params[:display_items])
	@location_names = Participant.uniq.pluck(:p_loc)

	if(params[:filter_by_location] != nil)
		@participants=Participant.where("p_loc"=> params[:filter_by_location])
	end
	if(params[:sort].to_s == 'P_Name')
			 @participants = @participants.sort_by{|p| p.p_name }
	elsif(params[:sort].to_s == 'p_loc')
		 @participants = @participants.sort_by{|p| p.p_loc }
	end
	#@location_names= Set.new
	#@participants.each do |p|
	#	@location_names.add(p.p_loc)
	#end
end

def new
	#@participant = @participant.participants.new
end

def create
	@participant = Participant.new(participant_params)
	@participant.save
	redirect_to participant_path(@participant)
end

def show
	@participant = Participant.find(params[:id])
	@competition_enrolled = Enrollment.where("participant_id" => params[:id])
end

def edit
	@participant = Participant.find(params[:id])
end

def update
	@participant = Participant.find params[:id]
	@participant.update_attributes!(params[:participant].permit(:p_name, :p_loc, :p_phone, :p_email, :p_des))
	flash[:notice] = "#{@participant.p_name} successfully updated."
	redirect_to new_participant_enrollment_path(@participant)
end

def destroy
	@participant = Participant.find params[:id]
	@participant.destroy
	flash[:notice] = "Participant '#{@participant.p_name}' successfuly deleted'"
	redirect_to participants_path
end
def select
	@participants = Participant.all
	@selected_participants = {}
	@selected_participants = params[:participants]
	if @selected_participants == {}
		@selected_participants = Hash[(@participants.map {|participant| [participant, participant]})]
	end
	
	render @selected_participants
	#Participants.find_all[]
	puts("Faltu")
	puts(@selected_participants)

	#redirect_to participants_path
	
	#redirect_to competition_round_path(@competition, @round)
	#redirect_to competition_round_participants_path(@competition, @round, @selected_participants)
end


private :participant_params
end
