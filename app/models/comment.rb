class Comment < ActiveRecord::Base
  belongs_to :post
  validates :title, presence: true,
                    length: { minimum: 5 }
end
