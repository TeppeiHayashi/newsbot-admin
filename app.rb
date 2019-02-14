class NewsBotAdmin < Sinatra::Base
 include Utility
 
 get '/' do
    data = ClickCount.get_month_daily
    
    @res = Array.new
    data[:categories].each_with_index do |w,i|
        @res.push([data[:categories][i],data[:click_counts][i].to_i])
    end
    
    Logger.info(@res)
    
    erb :index
 end

end