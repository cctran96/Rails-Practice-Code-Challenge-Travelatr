class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, :age, :bio, presence: true
    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0, only_integer: true}
    validates :bio, length: {minimum: 30}

    def total_likes
        self.posts.sum("likes")
    end

    def most_popular
        self.posts.order("likes DESC")[0]
    end

    def top_five
        self.destinations.group("id").order("count(destinations.id) desc").limit(5)
    end
end