class Total < ActiveRecord::Base
  has_many :consumptions
  attr_accessible :remarks, :consumptions_count, :total_cost, :date
  
end