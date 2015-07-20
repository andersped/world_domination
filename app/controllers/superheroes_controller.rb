class SuperheroesController < ApplicationController
  before_action :confirm_logged_in, only: [:new, :edit, :update, :destroy]
  before_action :set_superhero, only: [:show, :edit, :update, :destroy]

  def index
  	@superheroes = Superhero.all
  end

  def new
  	@superhero = Superhero.new
  	@teams = Team.all
  end

  def create
  	@superhero = Superhero.create(superhero_params)
  	if @superhero.save
  		redirect_to superheroes_path, notice: 'Superhero Added Successfully!'
  	else
  		reder :new
  	end
  end

 	def edit
 		@teams = Team.all
  end

  def show
  	@superhero_teams = @superhero.teams
  end

  def update
  	@superhero.update(superhero_params)
  	if @superhero.save
  		redirect_to superhero_path(@superhero), notice: 'Superhero has been Successfully Updated'
  	else
  		render :edit
    end
  end

  def destroy
  	@superhero.destroy
  	redirect_to superheroes_path
  end

  private

  def superhero_params
  	params.require(:superhero).permit(
  		:name,
  		:height,
  		:bio,
  		:image_url,
  		:team_ids => []
  		)
  end

  def set_superhero
  	@superhero = Superhero.find_by(id: params[:id])
  end


end
