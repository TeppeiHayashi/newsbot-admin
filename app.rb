class NewsBotAdmin < Sinatra::Base
 include Utility
 
 helpers do
    include Rack::Utils
    alias_method :h, :escape_html
end

before do
   @startDate = params[:startDate] ? params[:startDate] : nil 
   @endDate = params[:endDate] ? params[:endDate] : nil
   @users_count = User.get_user_count
   @push_users_parcent = User.get_all_push_user.length / @users_count.to_f * 100
   @clicks_count = ClickLog.get_click_count  
end
 
 get '/' do
    data = ClickCount.get_aggregation_by_category_each_date
    
    @label = data[:categories].to_json
    @count = data[:click_counts].to_json
    
    erb :index
 end
 
 post '/' do
   
   data = ClickCount.get_aggregation_by_category_each_date(@startDate,@endDate)
    
   @label = data[:categories].to_json
   @count = data[:click_counts].to_json
   
   erb :index
 end

end