class User < ApplicationRecord
  include Passpartu

  has_many :comments, as: :commentable, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  enum role: {
    member: 1,
    admin: 10
  }
end
