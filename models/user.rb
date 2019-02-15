class User
    private
    include Utility
    
    public
    
    def self.create(line_id)
        DB[:Users].insert(line_id: line_id)
    end
    
    def self.get_user_count
        DB[:Users].count.to_i
    end
    
    def self.get_user_id(line_id)
        DB[:Users].where(line_id: line_id).first[:id]
    end
    
    def self.get_all_push_user
        DB[:Users].where(push_flag: 1).all.map do |user|
            user[:line_id]
        end
    end
    
    def self.delete(line_id)
        DB[:Users].where(line_id: line_id).delete
    end
    
    def self.update_push_flag(line_id,flag = 1)
        return false if flag != 1 && flag != 0
        DB[:Users].where(line_id: line_id).update(push_flag: flag)
    end
end