class Room < ApplicationRecord
  # class_nameでカラム名が何であるのかを定義する
  belongs_to :leader, class_name: "User"
  belongs_to :member, class_name: "User"
  has_many :dms, dependent: :destroy
  has_many :users, dependent: :destroy

  # DM機能
  def dm_partner(current_user)
    if current_user.id == member_id
      User.find_by(id: leader_id)
    else
      User.find_by(id: member_id)
    end
  end
end
