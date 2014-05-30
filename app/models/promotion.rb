class Promotion < ActiveRecord::Base

  scope :is_active, lambda {
    where('CURRENT_DATE >= date_start and date_end >= CURRENT_DATE')
  }

end
