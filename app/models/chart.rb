class Chart < ActiveRecord::Base
  belongs_to :database, foreign_key: :db_id, primary_key: :id
  has_many :metrics
end
