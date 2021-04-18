class Post < ApplicationRecord
    extend FriendlyID
    friendly_id :title, use: :slugged

    def should_generate_new_friendly_id?
        title_changed?
    end
    
end
