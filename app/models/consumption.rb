class Consumption < ActiveRecord::Base
  # belongs_to :total
  attr_accessible :desc, :total_id, :tags, :cost, :date
  validates_presence_of :date, :cost, :desc

  before_create do
    Total.transaction do
      total = Total.find_by_date(self.date)
      total ||= Total.new
      total.date = self.date
      total.consumptions_count += 1
      total.total_cost += self.cost
      total.save!
      self.total_id = total.id
    end
  end

  before_destroy do
    self.total.consumptions_count -= 1
  end

end