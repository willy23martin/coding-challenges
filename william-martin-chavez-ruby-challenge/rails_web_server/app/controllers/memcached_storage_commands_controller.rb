class MemcachedStorageCommandsController < ApplicationController
  @@storageCommandManager = MemcachedStorageCommandManager.new

  def index
    @storageCommand = ""
    @result = ""
    puts "Arrives to storage result controller"
    if(params[:storageCommand] == nil)
      @storageCommand = ""
      puts "Your command params are nil."
      @result = "Your command params are nil."
    else
      @storageCommand = params[:storageCommand]
      puts @storageCommand
    end
    case(@storageCommand)
    when "1" #set
      puts "Arrives to set option"
      puts params[:post][:commandBody]
      commandBody = params[:post][:commandBody]
      new_key = commandBody.split(",")[0]
      new_value = commandBody.split(",")[1]
      @result = @@storageCommandManager.execute_set_command(new_key, new_value)
    when "2" #add
      puts "Arrives to add option"
      puts params[:post][:commandBody]
      commandBody = params[:post][:commandBody]
      new_key = commandBody.split(",")[0]
      new_value = commandBody.split(",")[1]
      @result = @@storageCommandManager.execute_add_command(new_key, new_value)
    when "3" #replace
      puts "Arrives to replace option"
      puts params[:post][:commandBody]
      commandBody = params[:post][:commandBody]
      key = commandBody.split(",")[0]
      new_value = commandBody.split(",")[1]
      @result = @@storageCommandManager.execute_replace_command(key, new_value)
    else
      @result = "Select a Storage Command option."
    end
  end

end
