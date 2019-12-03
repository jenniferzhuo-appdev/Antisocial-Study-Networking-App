# == Schema Information
#
# Table name: bookmark_spots
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  favorite_location_id :integer
#  user_id              :integer
#

class BookmarkSpot < ApplicationRecord
end
