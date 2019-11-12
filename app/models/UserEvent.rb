class UserEvent < ActiveRecord::Base
    
    belongs_to :users
    belongs_to :books

end

