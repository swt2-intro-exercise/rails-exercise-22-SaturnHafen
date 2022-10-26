class Author < ApplicationRecord
    validates :last_name, presence: true

    def name
        first_name + " " + last_name
    end

    def papers=(papers)
        @papers = papers
    end

    def papers
        @papers.to_a
    end
end
