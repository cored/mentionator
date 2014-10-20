require 'vcr_helper'
require 'faraday'
require 'faraday_middleware'
require_relative '../../app/services/redbooth'

describe Redbooth do 
  let(:client_id) { ENV['REDBOOTH_CLIENT_ID'] }
  let(:secret_id) { ENV['REDBOOTH_CLIENT_SECRET'] }
  let(:access_token) { '89b6aa954099798ab112e4cc6038694707277b16a75e3483e862271ad0d33459' }
  let(:refresh_token) { 'cd406c3dcbeb84cae0a1dd5230a6f11806751d8fa7cb1e006f7239540b381a7e' }

  context 'configures rebooth client' do 
    it 'returns info for the current user' do 
      VCR.use_cassette('valid-authorization') do 
        expect(Redbooth.(client_id, 
                         secret_id, 
                         access_token, refresh_token).authorized?).to eql true
      end
    end
  end
end
