class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rooms,    dependent: :destroy
  has_many :messages, dependent: :destroy

  def username
    email.split('@')[0]
  end
end
