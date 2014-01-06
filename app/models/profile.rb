class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :company_profiles
  has_many :companies, :through => :company_profiles

  accepts_nested_attributes_for :company_profiles, :allow_destroy => true
end
