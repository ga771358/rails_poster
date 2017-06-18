class Post < ApplicationRecord
    validates :content, length: { maximum: 20 }
    belongs_to :user
    has_many :comments, :dependent => :destroy
end
