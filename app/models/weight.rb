class Weight < ActiveRecord::Base
  belongs_to :user
  belongs_to :weight
end