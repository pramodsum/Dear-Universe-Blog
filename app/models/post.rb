class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    unique: true,
                    length: { minimum: 5 }
  validates :text, presence: true
end
