class MemcachedRetrievalCommandsController < ApplicationController
  @@retrievalCommandManager = MemcachedRetrievalCommandManager.new

  def result
    @retrievalCommand = ""
    @result = ""
    puts "Arrives to result controller"
    if(params[:retrievalCommand] == nil)
      @retrievalCommand = ""
      puts "params nil"
    else
      @retrievalCommand = params[:retrievalCommand]
      puts @retrievalCommand
    end
    case(@retrievalCommand)
    when "1" #get
      puts "Arrives to get option"
      puts params[:post][:stored_key]
      stored_key = params[:post][:stored_key]
      @result = @@retrievalCommandManager.execute_get_command(stored_key)

    when "2" #gets
      puts "Arrives to gets option"
      puts params[:post][:stored_key]
      stored_keys = params[:post][:stored_key]
      @result = @@retrievalCommandManager.execute_gets_command(stored_keys)
    else
      @result = "Select a Retrieval Command option"
    end
  end
end

