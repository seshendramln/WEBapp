class Company < ActiveRecord::Base
	has_many :ratings, :through=> :users
    has_many :ratings
	has_many :company_profiles
  has_many :profiles, :through => :company_profiles
  accepts_nested_attributes_for :company_profiles, :allow_destroy => true
  
  has_attached_file :logo, :styles => { :medium => "100x100>", :original=> "50x50", :thumb => "100x100>" },
   :default_url => "/images/:style/missing.png"

  



end

