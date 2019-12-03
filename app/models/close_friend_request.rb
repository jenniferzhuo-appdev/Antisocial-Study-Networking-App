# == Schema Information
#
# Table name: close_friend_requests
#
#  id          :integer          not null, primary key
#  accepted    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  recipent_id :integer
#  sender_id   :integer
#

class CloseFriendRequest < ApplicationRecord
end
