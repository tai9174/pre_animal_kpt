class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy  ]
  
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


  def kpts0
    @team = Team.find(params[:team_id])
    @join_team_users= @team.join_team_users
    @day0_kpts=[]
    @join_team_users.each do |join_team_user|
      join_team_user.kpts.each do |kpt|
        if kpt.date.strftime('%Y/%m/%d')== Time.now.strftime('%Y/%m/%d')
          @day0_kpts<< kpt
        end
      end
    end
  end


  def kpts_1
    @team = Team.find(params[:team_id])
    @join_team_users= @team.join_team_users
    @day_1_kpts=[]
    @join_team_users.each do |join_team_user|
      join_team_user.kpts.each do |kpt_1|
        if kpt_1.date.strftime('%Y/%m/%d')== (Time.now.-1.day).strftime('%Y/%m/%d')
          @day_1_kpts<< kpt_1
        end
      end
    end
  end

  def kpts_2
    @team = Team.find(params[:team_id])
    @join_team_users= @team.join_team_users
    @day_2_kpts=[]
    @join_team_users.each do |join_team_user|
      join_team_user.kpts.each do |kpt_2|
        if kpt_2.date.strftime('%Y/%m/%d')== (Time.now.-2.day).strftime('%Y/%m/%d')
          @day_2_kpts<< kpt_2
        end
      end
    end
  end
  
  def kpts_3
    @team = Team.find(params[:team_id])
    @join_team_users= @team.join_team_users
    @day_3_kpts=[]
    @join_team_users.each do |join_team_user|
      join_team_user.kpts.each do |kpt_3|
        if kpt_3.date.strftime('%Y/%m/%d')== (Time.now.-3.day).strftime('%Y/%m/%d')
          @day_3_kpts<< kpt_3
        end
      end
    end
  end
  
  def kpts_4
    @team = Team.find(params[:team_id])
    @join_team_users= @team.join_team_users
    @day_4_kpts=[]
    @join_team_users.each do |join_team_user|
      join_team_user.kpts.each do |kpt_4|
        if kpt_4.date.strftime('%Y/%m/%d')== (Time.now.-4.day).strftime('%Y/%m/%d')
          @day_4_kpts<< kpt_4
        end
      end
    end
  end
  def kpts_5
    @team = Team.find(params[:team_id])
    @join_team_users= @team.join_team_users
    @day_5_kpts=[]
    @join_team_users.each do |join_team_user|
      join_team_user.kpts.each do |kpt_5|
        if kpt_5.date.strftime('%Y/%m/%d')== (Time.now.-5.day).strftime('%Y/%m/%d')
          @day_5_kpts<< kpt_5
        end
      end
    end
  end

  def kpts_6
    @team = Team.find(params[:team_id])
    @join_team_users= @team.join_team_users
    @day_6_kpts=[]
    @join_team_users.each do |join_team_user|
      join_team_user.kpts.each do |kpt_6|
        if kpt_6.date.strftime('%Y/%m/%d')== (Time.now.-6.day).strftime('%Y/%m/%d')
          @day_6_kpts<< kpt_6
        end
      end
    end
  end
  def kpts_7
    @team = Team.find(params[:team_id])
    @join_team_users= @team.join_team_users
    @day_7_kpts=[]
    @join_team_users.each do |join_team_user|
      join_team_user.kpts.each do |kpt_7|
        if kpt_7.date.strftime('%Y/%m/%d')== (Time.now.-7.day).strftime('%Y/%m/%d')
          @day_7_kpts<< kpt_7
        end
      end
    end
  end
  def calendar
    @team = Team.find(params[:team_id])
    # @team_kpts=@team.join_team_users.kpts
    @join_team_users= @team.join_team_users
    @join_team_users.each do |join_team_user|
      @join_kpts=join_team_user.kpts.order(date: :desc)
      @join_kpts.each do |join_kpt|
        @join_kpt=join_kpt
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:team_name)
  end
end
