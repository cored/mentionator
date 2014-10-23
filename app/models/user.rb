class User < ActiveRecord::Base

  validates :token, :refresh_token, presence: true

  def self.create_with_redbooth_authorization(token, refresh_token)
    create!(token: token, refresh_token: refresh_token)
  end
end
