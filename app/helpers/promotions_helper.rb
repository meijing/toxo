module PromotionsHelper

  def print_dates promo
    @text = 'Desde '
    if !promo.date_start.nil?
      @text.concat(promo.date_start.strftime("%d/%m/%Y"))
    end
    @text.concat(' hasta ')
    if !promo.date_end.nil?
      @text.concat(promo.date_end.strftime("%d/%m/%Y"))
    end
    if !promo.end_stocks.nil? && promo.end_stocks == 1
      @text.concat('fin de existencias')
    end
    @text
  end

  def get_text promo
    @porcentage = ''
    if promo.style == 2
      @porcentage = '%'
    end
    promo.description.concat(' Dto. ').concat(promo.text).concat(@porcentage)
  end
end
