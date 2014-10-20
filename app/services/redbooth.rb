module Redbooth
  extend self

  def call(client_id, client_secret, access_token, refresh_token)
    Client.new(client_id, client_secret,
               access_token, refresh_token)
  end

  class Client
    def initialize(id, secret, token, refresh_token)
      @id = id
      @secret = secret
      @token = token
      @refresh_token = refresh_token
      build_http_client
    end

    def authorized?
      http_client.get("/api/3/me?access_token=#{token}").status == 200
    end

    def refresh
      http_client.get('/api/3/oauth2/token', { client_id: id,
                                        client_secret: secret,
                                        refresh_token: refresh_token ,
                                        grant_type: 'refresh_token',
                                        redirect_uri: ENV['URI_REDIRECT'] })
    end

    private

    def build_http_client
      @http_client ||= Faraday.new(url: 'https://redbooth.com/') do |faraday|
        faraday.request :oauth2, token
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

    attr_reader :id, :secret, :token, :refresh_token, :http_client
  end
end

require_relative 'redbooth/task_list'
