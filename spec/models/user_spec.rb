require 'rails_helper' 

describe User do 

  describe '.create_with_redbooth_authorization' do 
    let(:token) { 'my token' } 
    let(:refresh_token) { 'my refresh token' } 
    it 'creates a new user with redbooth authorization data' do 
      expect { 
        User.create_with_redbooth_authorization(token, refresh_token)
      }.to change(User, :count).by 1
    end

    it 'throws an exception for blank token' do 
      expect { 
        User.create_with_redbooth_authorization(nil, refresh_token)
      }.to raise_error
    end

    it 'throws an exception for blank refresh_token' do 
      expect { 
        User.create_with_redbooth_authorization(token, nil)
      }.to raise_error
    end
  end
end
