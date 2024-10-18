class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :post, counter_cache: true

  validates :content, presence: true
end
