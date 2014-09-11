xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc "http://www.toxo.es"
    
  end

  xml.url do
    xml.loc "http://www.toxo.es/who_are#toxo_historia"
    
  end

  xml.url do
    xml.loc "http://www.toxo.es/our_marks#toxo_marcas"
    
  end

  @marks.each do |mark|
    xml.url do
      xml.loc "http://www.toxo.es/productos?mark_id="+mark.id.to_s+"#"+mark.name
    
    end
  end

  @products.each do |product|
    xml.url do
      xml.loc "http://www.toxo.es/productos?category_id="+product.category_id.to_s+"&mark_id="+product.mark_id.to_s
    
    end

    xml.url do
      xml.loc "http://www.toxo.es/productos?category_id="+product.category_id.to_s+"&mark_id="+product.mark_id.to_s+"&product_type_id="+product.product_type_id.to_s
    
    end
  end

  @categories.each do |category|
    xml.loc "http://www.toxo.es/productos?category_id="+category.id.to_s+"#"+category.name
    
  end

  @cpt.each do |cpt|
    xml.loc "http://www.toxo.es/productos?category_id="+cpt.category_id.to_s+"&product_type_id="+cpt.product_type_id.to_s
    
  end

  xml.url do
    xml.loc "http://www.toxo.es/all_products#toxo_productos"
    
  end

  xml.url do
    xml.loc "http://www.toxo.es/all_promotions#toxo_promociones"
    
  end

  @promotions.each do |promotion|
    xml.loc "http://www.toxo.es/show_promotion?id="+promotion.id.to_s
    
  end

  xml.url do
    xml.loc "http://www.toxo.es/outlet#toxo_outlet"
    
  end

  xml.url do
    xml.loc "http://www.toxo.es/contact"
    
  end

  xml.url do
    xml.loc "http://www.toxo.es/sales#rebajas_toxo"
    
  end
end
