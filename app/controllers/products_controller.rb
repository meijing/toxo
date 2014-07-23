class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:mark_id].nil?
      @products = Product.all.order(:name)
    else
      @mark_id = params[:mark_id]
      @product_type_id = params[:product_type_id]
      @category_id = params[:category_id]
      if !@category_id.nil? && !@product_type_id.nil? && !@mark_id.nil?
        @products = Product.where('category_id = ? and product_type_id = ? and mark_id = ?', @category_id, @product_type_id, @mark_id).order(:name)
      elsif !@mark_id.nil?
          @products = Product.where('mark_id = ?', @mark_id).order(:name)
      else
        @products = Product.all.order(:name)
      end
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @mark_id = params[:mark_id]
    @product_type_id = params[:product_type_id]
    @category_id = params[:category_id]
    @mark_associated = @product.mark
  end

  # GET /products/new
  def new
    @mark_id = params[:mark_id]
    @product_type_id = params[:product_type_id]
    @category_id = params[:category_id]
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @mark_id = params[:mark_id]
    @product_type_id = params[:product_type_id]
    @category_id = params[:category_id]
    @mark_associated = @product.mark
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    if !@product.nil?
      @product.check_is_for_sale
    end

    respond_to do |format|
      if @product.save

        @category_id = session[:category_id]
        session[:category_id] = nil
        @product_type_id = session[:product_type_id]
        session[:product_type_id] = nil
        @mark_id = session[:mark_id]
        session[:mark_id] = nil

        format.html { redirect_to products_path(:category_id => @category_id, :product_type_id => @product_type_id, :mark_id => @mark_id), notice: 'Product was successfully created.' }
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
        @category_id = session[:category_id]
        session[:category_id] = nil
        @product_type_id = session[:product_type_id]
        session[:product_type_id] = nil
        @mark_id = session[:mark_id]
        session[:mark_id] = nil

        format.html { redirect_to products_path(:category_id => @category_id, :product_type_id => @product_type_id, :mark_id => @mark_id), notice: 'Product was successfully updated.' }
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
    @product.destroy

    @category_id = session[:category_id]
    session[:category_id] = nil
    @product_type_id = session[:product_type_id]
    session[:product_type_id] = nil
    @mark_id = session[:mark_id]
    session[:mark_id] = nil
    
    redirect_to products_path(:category_id => @category_id, :product_type_id => @product_type_id, :mark_id => @mark_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image, :product_type_id, :category_id, :mark_id, :outlet, :sale, :new_collection)
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


   
end
