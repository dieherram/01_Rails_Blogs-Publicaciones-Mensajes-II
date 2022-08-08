class Blog < ApplicationRecord
    has_many :posts
    has_many :owners

    has_many :users, through: :owners, dependent: :delete_all
    has_many :users, through: :posts, dependent: :delete_all
end
