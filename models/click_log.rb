class ClickLog
    private
    include Utility
    
    public
    
    def self.insert(user_id,category_id)
        DB[:click_log].insert(user_id: user_id, 
                              category_id: category_id)
    end

end