class ConfigOutletsController < ApplicationController
    
  # GET /config_outlet/new
  def new
    @config_outlet = ConfigOutlet.new
    
    @categories = ConfigOutlet.select('cat.id, cat.name').joins('join categories cat on cat.id = config_outlets.category_id').order('cat.name')
    @productTypes = ConfigOutlet.select('pt.id, pt.name').joins('join product_types pt on pt.id = config_outlets.product_type_id').order('pt.name')
  end
  
  # POST /config_outlet
  # POST /config_outlet.json
  def create
    @config_outlet = ConfigOutlet.new(config_outlet_params)
    
    @existeRegistro = 0
    
    if !@config_outlet.category_id.nil?
      @existsCat = ConfigOutlet.where('category_id = ?', @config_outlet.category_id)
      if !@existsCat.nil? && !@existsCat.empty?
        @existeRegistro = 1
      end
    elsif !@config_outlet.product_type_id.nil?
      @existsPt = ConfigOutlet.where('product_type_id = ?', @config_outlet.product_type_id)
      if !@existsPt.nil? && !@existsPt.empty?
        @existeRegistro = 1
      end
    end

    if @existeRegistro == 0
        @config_outlet.save
    end
    
    respond_to do |format|
      format.html { redirect_to  new_config_outlet_path, notice: 'Category was successfully created.' }
      format.json { render action: 'show', status: :created, location: @category }
    end
  end
  
  # DELETE /config_outlet/1
  # DELETE /config_outlet/1.json
  def destroy
    @config_outlet = ConfigOutlet.find(params[:id])
    @config_outlet.destroy

    redirect_to new_config_outlet_path
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def config_outlet_params
    params.require(:config_outlet).permit(:category_id, :product_type_id)
  end
  
end
