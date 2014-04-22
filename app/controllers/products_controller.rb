class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:mark_id].nil?
      @products = Product.all
    else
      @products = Mark.find(params[:mark_id]).product
      @mark_id = params[:mark_id]
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @mark_id = params[:mark_id]
    @mark_associated = @product.mark
  end

  # GET /products/new
  def new
    @mark_id = params[:mark_id]
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @mark_id = params[:mark_id]
    @mark_associated = @product.mark
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        if !params[:products].nil?
          @marks = params[:products][:marks]
          save_relation_with_marks @marks
        end

        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)

        if params[:products].nil?
          destroy_relations_with_marks @product.id
        else
          destroy_relations_with_marks @product.id
          @marks = params[:products][:marks]
          save_relation_with_marks @marks
        end

        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    destroy_relations_with_marks @product.id
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image)
    end

    def save_relation_with_marks marks
      if !marks.nil? && marks.length >0
        marks.each do |m|
          if m != ""
            @exists = MarkProduct.where('mark_id = ? and product_id = ?', m, @product.id)
            if @exists.nil? || @exists.length == 0
              @new_cpt = MarkProduct.new
              @new_cpt.mark_id = m
              @new_cpt.product_id = @product.id
              @new_cpt.save
            end
          end
        end
      end
    end

    def destroy_relations_with_marks product_id
      @relations_to_destroy =  MarkProduct.where('product_id=?', product_id)
      @relations_to_destroy.each do |ctp|
        ctp.destroy
      end
    end
end
