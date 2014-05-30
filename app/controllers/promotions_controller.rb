# encoding: utf-8
class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]

  # GET /promotions
  # GET /promotions.json
  def index
    @promotions = Promotion.all
  end

  # GET /promotions/1
  # GET /promotions/1.json
  def show
  end

  # GET /promotions/new
  def new
    @promotion = Promotion.new
  end

  # GET /promotions/1/edit
  def edit
    @date_start = Promotion.find(params[:id]).date_start
    @date_end = Promotion.find(params[:id]).date_end
  end

  # POST /promotions
  # POST /promotions.json
  def create
    @promotion = Promotion.new(promotion_params)
    
    check_dates(@promotion, @promotion.date_start, @promotion.date_end)
    @date_start = @promotion.date_start
    @date_end = @promotion.date_end
    respond_to do |format|
      if @promotion.errors.count == 0 && @promotion.save
        format.html { redirect_to promotions_path }
        format.json { render action: 'show', status: :created, location: @promotion }
      else
        format.html { render action: 'new' }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /promotions/1
  # PATCH/PUT /promotions/1.json
  def update
    check_dates(@promotion, promotion_params[:date_start], promotion_params[:date_end])
    if !promotion_params[:date_start].nil?
      @date_start = promotion_params[:date_start].to_date
    end

    if !promotion_params[:date_end].nil?
      @date_end = promotion_params[:date_end].to_date
    end
    respond_to do |format|
      if @promotion.errors.count == 0 && @promotion.update(promotion_params)
        format.html { redirect_to promotions_path }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.json
  def destroy
    @promotion.destroy
    respond_to do |format|
      format.html { redirect_to promotions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promotion_params
      params.require(:promotion).permit(:description, :date_start, :date_end, :style, :text, :catalog)
    end

    def check_dates promotion, date_start, date_end
      if !date_start.nil? && !date_end.nil? && 
          date_start != "" && date_end != "" &&
          date_start.to_date > date_end.to_date
        promotion.errors[:base] << "La fecha de finalización es anterior a la de inicio"
      end
    end
end
