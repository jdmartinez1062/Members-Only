class Post < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, length: {in: 3..30}
    validates :content, presence: true, length: {in: 20..500}


end
