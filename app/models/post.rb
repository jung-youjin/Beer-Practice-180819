class Post < ActiveRecord::Base
    validates_presence_of :title, :content
    
    searchable do
        text :title, :content, :hashtag
    end
    
end
