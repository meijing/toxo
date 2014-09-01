class ImageHomesController < ApplicationController
  before_action :set_image_home, only: [:show, :edit, :update, :destroy]

  # GET /image_homes
  # GET /image_homes.json
  def index
    @image_homes = ImageHome.all
  end

  # GET /image_homes/1
  # GET /image_homes/1.json
  def show
  end

  # GET /image_homes/new
  def new
    @image_home = ImageHome.new
  end

  # GET /image_homes/1/edit
  def edit
  end

  # POST /image_homes
  # POST /image_homes.json
  def create
    @image_home = ImageHome.new(image_home_params)

    respond_to do |format|
      if @image_home.save
        format.html { redirect_to image_homes_path, notice: 'Image home was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image_home }
      else
        format.html { render action: 'new' }
        format.json { render json: @image_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_homes/1
  # PATCH/PUT /image_homes/1.json
  def update
    respond_to do |format|
      if @image_home.update(image_home_params)
        format.html { redirect_to image_homes_path, notice: 'Image home was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_homes/1
  # DELETE /image_homes/1.json
  def destroy
    @image_home.destroy
    respond_to do |format|
      format.html { redirect_to image_homes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_home
      @image_home = ImageHome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_home_params
      params.require(:image_home).permit(:name, :image, :second_image)
    end
end
