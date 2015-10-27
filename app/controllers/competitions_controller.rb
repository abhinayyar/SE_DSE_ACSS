class CompetitionsController < ApplicationController
before_filter :check_authentication

def check_authentication
	if session[:user_type] == nil
		flash[:notice] = 'Select one of the user types'
		redirect_to root_path
	end

end

def competition_params
	params.require(:competition).permit(:competition_name, :competition_des, :no_of_rounds)
end

def index
	@competitions = Competition.all
	@welcome_judge = Judge.where("id"=>session[:user_id])
	@welcome_judge.each do |info|
		@judge_name = info.j_name
	end
end

def new
end

def show 
	@competition = Competition.find(params[:id])
end

def create
	#render json: params[:round].inspect
	@competition = Competition.new(competition_params)
	@competition.save
	redirect_to competition_path(@competition)
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
	  @competition.update_attributes!(params[:competition].permit(:competition_name, :competition_des, :no_of_rounds))
	  flash[:notice] = "#{@competition.competition_name} successfully updated."
	  redirect_to competition_path(@competition)
  end
end

def destroy
  puts "destroy"
	@competition = Competition.find params[:id]
	#@competition = competition
	@competition.destroy
	flash[:notice] = "Competition '#{@round.title}' successfuly deleted'"
	redirect_to competitions
end

private :competition_params

end

