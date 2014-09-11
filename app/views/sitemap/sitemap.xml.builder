xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc "http://www.toxo.es"
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "http://www.toxo.es/who_are#toxo_historia"
    xml.priority 0.69
  end

  xml.url do
    xml.loc "http://www.toxo.es/our_marks#toxo_marcas"
    xml.changefreq "monthly"
    xml.priority 0.85
  end

  @marks.each do |mark|
    xml.url do
      xml.loc "http://www.toxo.es/productos?mark_id="+mark.id.to_s+"#"+mark.name
      xml.changefreq "monthly"
      xml.priority 0.9
    end
  end

  @products.each do |product|
    xml.url do
      xml.loc "http://www.toxo.es/productos?category_id="+product.category_id.to_s+"&mark_id="+product.mark_id.to_s
      xml.changefreq "monthly"
      xml.priority 0.9
    end

    xml.url do
      xml.loc "http://www.toxo.es/productos?category_id="+product.category_id.to_s+"&mark_id="+product.mark_id.to_s+"&product_type_id="+product.product_type_id.to_s
      xml.changefreq "monthly"
      xml.priority 0.9
    end
  end

  @categories.each do |category|
    xml.loc "http://www.toxo.es/productos?category_id="+category.id.to_s+"#"+category.name
    xml.changefreq "monthly"
    xml.priority 0.9
  end

 
end
