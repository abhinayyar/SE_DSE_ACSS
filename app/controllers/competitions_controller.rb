class CompetitionsController < ApplicationController
before_filter :check_authentication

def check_authentication
	if session[:user_type] == nil
		flash[:notice] = 'Select one of the user types'
		redirect_to root_path
	end

end

def competition_params
	params.require(:competition).permit(:competition_name, :competition_des, :no_of_rounds,:year_id)
end

def index
	if session[:user_type] == 'admin'
		@competitions = Competition.where("year_id"=>params[:year_id]).limit(params[:display_items])
		@competition_count=@competitions.count
		if(params[:sort].to_s == 'competition_name')
			 @competitions = @competitions.sort_by{|c| c.competition_name }
		end
	else
		@judge = Judge.where("id"=>session[:user_id],"year_id"=>params[:year_id])[0]
		if @judge != nil
			judge_comps = CompetitionsJudge.where("judge_id" => @judge.id)
			comp_ids = Array.new
			judge_comps.each do |j_c|
			comp_ids.push(j_c.competition_id)
			end
			@competitions = Competition.where("id" => comp_ids)
		end
		
	end
end	

def new
	@competition= Competition.new
end

def show 
	@competition = Competition.find(params[:id])
end

def create
	#render json: params[:round].inspect
	@competition = Competition.new(competition_params)
	@competition[:year_id]=params[:year_id]
	if @competition.save
	redirect_to year_competition_path(params[:year_id],@competition)
	else
	render 'new'
	end
end

def edit
	@competition = Competition.find(params[:id])
end

def update
  puts "update"
  if params[:first_round] != nil
    puts params[:first_round]
    puts "round"
  else
    puts "inside else"
	  @competition = Competition.find params[:id]
	  @competition.update_attributes!(params[:competition].permit(:competition_name, :competition_des, :no_of_rounds,:year_id))
	  flash[:notice] = "#{@competition.competition_name} successfully updated."
	  redirect_to year_competition_path(params[:year_id],@competition)
  end
end

def destroy
  puts "destroy"
	@competition = Competition.find params[:id]
	#@competition = competition
	@competition.destroy
	flash[:notice] = "Competition '#{@competition.competition_name}' successfuly deleted'"
	redirect_to year_competitions_path(params[:year_id])
end

def add_part_to_round
	@competition = Competition.find params[:competition_id]
	enrollments = Enrollment.where("competition_id" => params[:competition_id])
	participant_ids = Array.new
	enrollments.each do |enrollment|
		participant_ids.push(enrollment.participant_id)
	end
  
	@participants = Participant.where("id" => participant_ids)
	@rounds = Round.where("competition_id" => params[:competition_id])
	

end

private :competition_params

end

