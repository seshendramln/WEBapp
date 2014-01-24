class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :companies
  belongs_to :rating
  has_many :user_companies
  has_many :ratings
  has_many :companies
  has_one :profile
  has_many :company_ratings




end
