class KptsController < ApplicationController
  before_action :set_kpt, only: %i[ show edit update destroy ]

  # GET /kpts or /kpts.json
  def index
    @kpts = Kpt.all
  end

  # GET /kpts/1 or /kpts/1.json
  def show
  end

  # GET /kpts/new
  def new
    @kpt = Kpt.new
  end

  # GET /kpts/1/edit
  def edit
  end

  # POST /kpts or /kpts.json
  def create
    @kpt = Kpt.new(kpt_params)

    respond_to do |format|
      if @kpt.save
        format.html { redirect_to kpt_url(@kpt), notice: "Kpt was successfully created." }
        format.json { render :show, status: :created, location: @kpt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kpt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kpts/1 or /kpts/1.json
  def update
    respond_to do |format|
      if @kpt.update(kpt_params)
        format.html { redirect_to kpt_url(@kpt), notice: "Kpt was successfully updated." }
        format.json { render :show, status: :ok, location: @kpt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kpt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kpts/1 or /kpts/1.json
  def destroy
    @kpt.destroy

    respond_to do |format|
      format.html { redirect_to kpts_url, notice: "Kpt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kpt
      @kpt = Kpt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kpt_params
      params.require(:kpt).permit(:keep_content, :keep_status, :problem_content, :problem_status, :try_content, :try_status, :favorite)
    end
end
