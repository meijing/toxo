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

end
