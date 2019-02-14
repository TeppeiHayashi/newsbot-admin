class Category
    private
    include Utility
    
    public
    
    def self.get_category_id(category_name)
        return DB[:Categories].where(name: category_name).first[:id]
    end

end