class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password

  validates :email, presence: true, uniqueness: {case_sensitive: false}, email: true

  state_machine :state, initial: :active do
    state :active
  end
end
