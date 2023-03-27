class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  validates :email, presence: true, uniqueness: true
end
