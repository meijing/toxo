class MarksController < ApplicationController
  before_action :set_mark, only: [:show, :edit, :update, :destroy]

  # GET /marks
  # GET /marks.json
  def index
    if params[:product_type_id].nil?
      @marks = Mark.all
    else
      @marks = ProductType.find(params[:product_type_id]).mark
      @product_type_id = params[:product_type_id]
    end
  end

  # GET /marks/1
  # GET /marks/1.json
  def show
    @product_type_id = params[:product_type_id]
    @product_type_associated = @mark.product_type
  end

  # GET /marks/new
  def new
    @product_type_id = params[:product_type_id]
    @mark = Mark.new
  end

  # GET /marks/1/edit
  def edit
    @product_type_id = params[:product_type_id]
    @product_type_associated = @mark.product_type
  end

  # POST /marks
  # POST /marks.json
  def create
    @mark = Mark.new(mark_params)

    respond_to do |format|
      if @mark.save
        if !params[:marks].nil?
          @product_types = params[:marks][:product_types]
          save_relation_with_product_types @product_types
        end

        format.html { redirect_to @mark, notice: 'Mark was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mark }
      else
        format.html { render action: 'new' }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marks/1
  # PATCH/PUT /marks/1.json
  def update
    respond_to do |format|
      if @mark.update(mark_params)

        if params[:marks].nil?
          destroy_relations_with_product_types @mark.id
        else
          destroy_relations_with_product_types @mark.id
          @product_types = params[:marks][:product_types]
          save_relation_with_product_types @product_types
        end

        format.html { redirect_to @mark, notice: 'Mark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1
  # DELETE /marks/1.json
  def destroy
    destroy_relations_with_product_types @mark.id
    @mark.destroy
    respond_to do |format|
      format.html { redirect_to marks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark
      @mark = Mark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mark_params
      params.require(:mark).permit(:name, :url, :image)
    end

    def save_relation_with_product_types product_types
      if !product_types.nil? && product_types.length >0
        product_types.each do |pt|
          if pt != ""
            @exists = MarkProductType.where('product_type_id = ? and mark_id = ? ', pt, @mark.id)
            if @exists.nil? || @exists.length == 0
              @new_cpt = MarkProductType.new
              @new_cpt.product_type_id = pt
              @new_cpt.mark_id = @mark.id
              @new_cpt.save
            end
          end
        end
      end
    end

    def destroy_relations_with_product_types mark_id
      @relations_to_destroy =  MarkProductType.where('mark_id=?', mark_id)
      @relations_to_destroy.each do |ctp|
        ctp.destroy
      end
    end
end
