class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]
  
  def index
    @teams = Team.all
  end

  # 追記する。render :new が省略されている。
  def new
    @team = Team.new
  end

  def show
    @join_team = current_user.join_teams.find_by(team_id: @team.id)
  end
  
  def edit
    unless @team.user == current_user
      redirect_to teams_path
    end
  end

  def create
    @team = current_user.owned_teams.new(team_params)

    respond_to do |format|
      if @team.save
        current_user.join_teams.create(team_id: @team.id)
        format.html { redirect_to team_url(@team), notice: "新しいチームが作られました。" }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kpts/1 or /kpts/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to team_url(@team), notice: "チームは更新されました。" }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kpts/1 or /kpts/1.json
  def destroy
    unless @team.user == current_user
      redirect_to teams_path
    end

    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: "チームは削除されました。" }
      format.json { head :no_content }
    end
  end

  def members
    @team = Team.find(params[:team_id])
    @join_team_users= @team.join_team_users
    @join_team = @team.join_teams
    # @join_teams = @join_team_users.join_teams.find_by(team_id: @team.id)
  end


  def kpts
    @team = Team.find(params[:team_id])
    @join_team_users= @team.join_team_users
    @today_kpts=[]
    @join_team_users.each do |join_team_user|
      join_team_user.kpts.each do |kpt|
        binding.pry
        if kpt.date.strftime('%Y/%m/%d')== DateTime.now.strftime('%Y/%m/%d')
          @today_kpts<< kpt
        end
      end
    end
  end
  
  def calendar
    @team = Team.find(params[:team_id])
    @join_team_users= @team.join_team_users
    @join_team_users.each do |join_team_user|
      @join_kpts=join_team_user.kpts.order(date: :desc)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:team_name,:creater_id)
  end
end
