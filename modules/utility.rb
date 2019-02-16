module Utility
  Logger = Logger.new('debug.log')
  Dotenv.load
  
  Sequel.application_timezone = :tokyo
  Sequel.database_timezone = :utc
  Sequel.typecast_timezone = :utc
  
  begin
    DB = Sequel.connect(ENV['CLEARDB_DATABASE_URL'])
  rescue => e
    Logger.fatal(e.message)
  end
  
  def tmp
    begin
      Sequel.connect(ENV['CLEARDB_DATABASE_URL'])
    rescue => e
      Logger.fatal(e.message)
      false
    end
  end

  module_function :tmp
end