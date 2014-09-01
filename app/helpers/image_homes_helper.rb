# encoding: utf-8
module ImageHomesHelper

  def get_name_image_home name
    if name.upcase == 'Area central'.upcase || name.upcase == 'Xeral Pardiñas'.upcase
      return 'SANTIAGO DE COMPOSTELA'
    elsif name.upcase == 'Vigo'.upcase
      return 'VIGO'
    end
  end

  def get_street_image_home name
    if name.upcase == 'Area central'.upcase
      return 'Área Central'
    elsif name.upcase == 'Xeral Pardiñas'.upcase
      return 'Xeral Pardiñas'
    elsif name.upcase == 'Vigo'.upcase
      return 'García Barbón'
    end
  end

end
