class Admin < ActiveRecord::Base
  ROLES = %w[pesquisador administrador]
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  validates :email, presence: true
  validates :name, presence: true
  validates :role, presence: true

  devise :database_authenticatable, 
         :rememberable, :trackable, :validatable, :registerable
         # :registerable, :recoverable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role
  # attr_accessible :title, :body
end
