class CompanyProfile < ActiveRecord::Base
	belongs_to :profile
	belongs_to :company
end
