class NewsBotAdmin < Sinatra::Base
 include Utility
 
 helpers do
    include Rack::Utils
    alias_method :h, :escape_html
end

before do
   @startDate = params[:startDate] ? params[:startDate] : Time.now.strftime("%Y-%m-%d")
   @endDate = params[:endDate] ? params[:endDate] : Time.now.strftime("%Y-%m-%d")
   @total_users_count = ClickLog.get_connection_user
   @users_count = User.get_user_count
   @push_users_parcent = User.get_all_push_user.length / @users_count.to_f * 100
   @clicks_count = ClickLog.get_click_count
   
   data = ClickCount.get_aggregation_by_category_each_date(@startDate,@endDate)
   @duration_clicks_count = data[:click_counts].sum
   @duration_connection_user = ClickLog.get_connection_user(@startDate,"#{@endDate} 23:59")
   @label = data[:categories].to_json
   @count = data[:click_counts].to_json
   
   @line_label= ClickCount.get_avg_clicks_per_hour[:label].to_json
   @line_count = ClickCount.get_avg_clicks_per_hour[:count].to_json
end
 
 get '/' do

    erb :index
 end
 
 post '/' do
   
   erb :index
 end

end