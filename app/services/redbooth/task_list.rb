module Redbooth 
  class TaskList 
    def self.retrieve(client) 
      new(client).retrieve
    end

    attr_reader :client, :task_items
    def initialize(client)
      @client = client
      @task_items = []
    end
    
    def retrieve
      @task_items = JSON.parse(client.http_client.get("/api/3/task_lists/?access_token=#{client.token}").body).map do |task_list| 
        TaskItem.new(task_list['id'], task_list['project_id'])  
      end
      self
    end

    def each 
      @task_items.each(&:block) if block_given?
      @task_items
    end

    private 

    TaskItem = Struct.new(:id, :project_id)
  end
end
