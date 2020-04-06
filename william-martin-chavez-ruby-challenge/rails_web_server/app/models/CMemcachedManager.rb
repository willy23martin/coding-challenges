class CMemcachedManager
  @@memcachedServer = ENV["MEMCACHED_SERVER_IP"]
  @@memcachedServicePort = ENV["MEMCACHED_SERVER_PORT"]
  def initialize
    @sasluser = ENV["MEMCACHED_SERVER_SASL_USER"]
    @saslkey = ENV["MEMCACHED_SERVER_SASL_PASSWORD"]
    @options = { :username => @sasluser, :password => @saslkey }
    @dalliDefinition = @@memcachedServer+":"+@@memcachedServicePort
    @dalliMemcachedClient = Dalli::Client.new(@dalliDefinition, @options)
  end
end

