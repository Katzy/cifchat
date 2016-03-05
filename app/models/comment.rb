class Comment < ActiveRecord::Base

  belongs_to :user

  validates :body, presence: true, length: {maximum: 500}

  class << self
    def remove_excessive!
      if all.count > 15
        order('created_at ASC').limit(all.count - 7).destroy_all
      end
    end
  end
end