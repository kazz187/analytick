class Database < ActiveRecord::Base
  has_many :charts, foreign_key: :db_id
end
