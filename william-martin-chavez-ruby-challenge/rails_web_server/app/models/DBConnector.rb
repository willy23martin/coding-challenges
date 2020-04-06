class DBConnector
  @@provider = 'MongoDB'
  def initialize
     @client = Mongo::Client.new('mongodb+srv://mooveit:<password>@rubychallenge-1xxew.mongodb.net/test?retryWrites=true&w=majority')
  end
end

