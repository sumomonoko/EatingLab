class Room < ApplicationRecord
  has_many :dms, dependent: :destroy
  has_many :users, dependent: :destroy
end
