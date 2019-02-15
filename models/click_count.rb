class ClickCount
 private
 include Utility
 
 public
 
 # 指定した日付間カテゴリ別集計
 def self.get_aggregation_by_category_each_date(startDay=Time.now.strftime("%Y-%m-%d"),endDay=Time.now.strftime("%Y-%m-%d"))
   result = DB[:v_click_count_daily].where({time: startDay..endDay})\
   .select_group(:name).select_append{sum(:click_count){}.as(click_count)}.order(:id)\
   .all.map do |row|
     row
   end
   
   graph = Hash.new { |h, k| h[k] = [] }
   result.each do |row|
     graph[:categories].push(row[:name])
     graph[:click_counts].push(row[:click_count].to_i)
   end
   
   graph
 end
end