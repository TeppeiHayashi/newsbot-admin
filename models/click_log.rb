class ClickLog
    private
    include Utility
    
    public
    
    def self.insert(user_id,category_id)
        DB[:click_log].insert(user_id: user_id, 
                              category_id: category_id)
    end

    def self.get_click_count
        DB[:click_log].count.to_i
    end

    def self.get_connection_user(startDay='2019-02-11 00:00:00',endDay=Time.now.strftime('%Y-%m-%d 23:59'))
      DB[:v_click_log_tz_jst].where({created_at: startDay..endDay}).group(:user_id).all.length
    end

end