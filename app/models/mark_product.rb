class MarkProduct < ActiveRecord::Base
  belongs_to :mark
  belongs_to :product
end
