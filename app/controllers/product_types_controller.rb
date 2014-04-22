class ProductTypesController < ApplicationController
  before_action :set_product_type, only: [:show, :edit, :update, :destroy]

  # GET /product_types
  # GET /product_types.json
  def index
    if params[:category_id].nil?
      @product_types = ProductType.all
    else
      @product_types = Category.find(params[:category_id]).product_type
      @category_id = params[:category_id]
    end
    @categories = Category.all
  end

  # GET /product_types/1
  # GET /product_types/1.json
  def show
    @category_id = params[:category_id]
    @categories_associated = @product_type.category
  end

  # GET /product_types/new
  def new
    @category_id = params[:category_id]
    @product_type = ProductType.new
  end

  # GET /product_types/1/edit
  def edit
    @category_id = params[:category_id]
    @categories_associated = @product_type.category
  end

  # POST /product_types
  # POST /product_types.json
  def create
    @product_type = ProductType.new(product_type_params)

    respond_to do |format|
      if @product_type.save
        if !@categories = params[:product_types].nil?
          @categories = params[:product_types][:categories]
          save_relation_with_categories @categories
        end

        format.html { redirect_to @product_type, notice: 'Product type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_types/1
  # PATCH/PUT /product_types/1.json
  def update
    respond_to do |format|
      if @product_type.update(product_type_params)

        if params[:product_types].nil?
          destroy_relations_with_categories @product_type.id
        else
          destroy_relations_with_categories @product_type.id
          @categories = params[:product_types][:categories]
          save_relation_with_categories @categories
        end
        
        format.html { redirect_to @product_type, notice: 'Product type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_types/1
  # DELETE /product_types/1.json
  def destroy
    destroy_relations_with_categories @product_type.id
    @product_type.destroy

    respond_to do |format|
      format.html { redirect_to product_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_type
      @product_type = ProductType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_type_params
      params.require(:product_type).permit(:name)
    end

    def save_relation_with_categories categories
      if !categories.nil? && categories.length >0
        categories.each do |cat|
          if cat != ""
            @exists = CategoryProductType.where('category_id = ? and product_type_id = ?', cat, @product_type.id)
            if @exists.nil? || @exists.length == 0
              @new_cpt = CategoryProductType.new
              @new_cpt.category_id = cat
              @new_cpt.product_type_id = @product_type.id
              @new_cpt.save
            end
          end
        end
      end
    end

    def destroy_relations_with_categories product_type_id
      @relations_to_destroy =  CategoryProductType.where('product_type_id=?', product_type_id)
      @relations_to_destroy.each do |ctp|
        ctp.destroy
      end
    end
end
