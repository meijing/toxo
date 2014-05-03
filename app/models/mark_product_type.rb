class MarkProductType < ActiveRecord::Base
  belongs_to :mark
  belongs_to :product_type
end