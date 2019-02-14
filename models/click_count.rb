class ClickCount
 private
 include Utility
 
 public
 def self.get_month_daily
   result = DB[:v_click_count_daily].where(time: '2019-02-12').all.map do |row|
     row
   end
   
   graph = Hash.new { |h, k| h[k] = [] }
   result.each do |row|
     graph[:categories].push(row[:name])
     graph[:click_counts].push(row[:click_count])
   end
   
   graph
 end
end