class Promotion < ActiveRecord::Base

  validates :description, :presence => true
  validates :text, :presence => true
  validates :style, :presence => true
  validates :date_start, :presence => true
  validates :date_end, :presence => true, :if => :presence_date_end?
  validates :end_stocks, :presence => true, :if => :presence_end_stocks?

  scope :is_active, lambda {
    where('CURRENT_DATE >= date_start and (date_end >= CURRENT_DATE or end_stocks = 1)')
  }

  scope :is_old, lambda {
    where('CURRENT_DATE >= date_end')
  }

  def presence_date_end?
    !date_start.nil? and end_stocks.nil?
  end

  def presence_end_stocks?
    !date_start.nil? and date_end.nil?
  end

end
