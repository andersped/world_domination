class TeamsController < ApplicationController
 	before_action :confirm_logged_in, only: [:new, :edit, :update, :destroy]
	before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
  	@teams = Team.all
  end

  def new
  	@team = Team.new
  	@superheroes = Superhero.all
  end

  def create
  	@team = Team.create(team_params)
  	if@team.save
  		redirect_to teams_path, notice: "Successfully Created a New Team"
  	else
  		render :new
  	end
  end

  def edit
  	@superheroes = Superhero.all
  end

  def show
  	@team_superheroes = @team.superheroes
  end

  def update
  	@team.update(team_params)
  	if @team.save
  		redirect_to team_path(@team), notice: "Team has been Updated!"
  	else
  		render :edit
  	end
  end

  def destroy
  	@team.destroy
  	redirect_to teams_path
  end

	private
  	def team_params
  		params.require(:team).permit(
  			:name,
  			:description,
  			:superhero_ids => []  
  			)
  	end

  	def set_team
  		@team = Team.find_by(id: params[:id])
  	end

end
