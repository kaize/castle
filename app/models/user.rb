class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}, email: true
  validates :password_digest, presence: true

  state_machine :state, initial: :active do
    state :active
  end
end
