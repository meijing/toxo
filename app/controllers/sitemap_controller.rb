class SitemapController < ApplicationController
  respond_to :html, :xml, :json

  def sitemap
    @marks = Mark.all.where('hidden is null or hidden =0')
    @products = Product.all
    @categories = Category.all
    @cpt = CategoryProductType.all
    @promotions = Promotion.is_active
   
  end

end
