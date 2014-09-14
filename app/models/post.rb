class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  scope :published, where(:published => true)

  belongs_to :author, :class_name => "AdminUser"

  validates :title, presence: true,
                    uniqueness: true,
                    length: { minimum: 5 }
  validates :text, presence: true
end
