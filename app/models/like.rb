class Like < ApplicationRecord
  belongs_to :user
  belongs_to :cd, counter_cache: :likes_count
end
