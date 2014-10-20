module Redbooth 
  module TaskList 
    extend self 
    
    def call(client)
      JSON.parse(client.http_client.get("/api/3/task_lists/?access_token=#{client.token}").body)
    end
  end
end
