class CompanyRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_one :companies, :through=>:users
  after_create :update_post_update_attribscore
  #def update_avgratings
  #company_rating = CompanyRating.where(:company_id =>user.company.id)
  #rating_size = ratings.collect(&:satisfaction).count
  #rating_size = collect(&:satisfaction).count
  #update_attributes(:avg_satisfaction => collect(&:satisfaction).sum.to_f/rating_size)
 #update_attributes(:avg_satisfaction => self.SUM(:satisfaction) / (:satisfaction).count)
  #update_attributes(:avg_satisfaction => self.SUM(:satisfaction)/COUNT(:satisfaction))
#end

  def update_post_update_attribscore
   self.company.update_attribscore
  end

  
end
 