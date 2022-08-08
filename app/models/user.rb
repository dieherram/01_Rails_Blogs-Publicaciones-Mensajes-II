class User < ApplicationRecord
    has_many :messages

    has_many :posts
    has_many :blogs, through: :posts, dependent: :delete_all

    has_many :owners
    has_many :blogs, through: :owners, dependent: :delete_all
end
