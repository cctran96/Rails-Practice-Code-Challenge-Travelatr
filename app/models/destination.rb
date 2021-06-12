class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def last_five
        self.posts.last(5)
    end

    def most_popular
        self.posts.order("likes DESC")[0]
    end

    def average_age
        self.bloggers.average("age")
    end

    def format_name
        self.name + ", " + self.country
    end
end
