class Activity < ApplicationRecord
    belongs_to :organiser
    belongs_to :category, :optional => true
    has_many :volunteers
    has_many :activities, through: :participation

    def self.order_list(sort_order)
        if sort_order == "date"
          order(date: :asc)
        elsif sort_order == "title"
          order(title: :asc)
        else
          order(created_at: :desc)
        end
      end
end
