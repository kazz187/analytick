class Metric < ActiveRecord::Base
  self.primary_keys = [:chart_id, :time]
  belongs_to :chart
end
