class Company < ActiveRecord::Base
	#has_many :ratings, :through=> :users
    #has_many :ratings
    has_many :company_ratings, :through=> :users
    has_many :company_ratings
	has_many :company_profiles
  has_many :profiles, :through => :company_profiles
  accepts_nested_attributes_for :company_profiles, :allow_destroy => true
  
  has_attached_file :logo, :styles => { :medium => "100x100>", :original=> "50x50", :thumb => "100x100>" },
   :default_url => "/images/:style/missing.png"

  def update_attribscore
  	 rating_size=company_ratings.collect(&:satisfaction).count
  	 update_attributes(:attrib_satisfaction => company_ratings.collect(&:satisfaction).sum.to_f/rating_size)

     rating_size1=company_ratings.collect(&:work_environment).count
  	 update_attributes(:attrib_work_environment => company_ratings.collect(&:work_environment).sum.to_f/rating_size1)

  	 rating_size2=company_ratings.collect(&:cd).count
  	 update_attributes(:attrib_cd => company_ratings.collect(&:cd).sum.to_f/rating_size2)

  	 rating_size3=company_ratings.collect(&:flexibility).count
  	 update_attributes(:attrib_flexibility => company_ratings.collect { |x| x.flexibility.to_i}.sum.to_f/rating_size3)

  	 rating_size4=company_ratings.collect(&:relation).count
  	 update_attributes(:attrib_relation => company_ratings.collect(&:relation).compact.sum.to_f/rating_size4)

  	 rating_size5=company_ratings.collect(&:leadership).count
  	 update_attributes(:attrib_leadership => company_ratings.collect(&:leadership).sum.to_f/rating_size5)

  	 rating_size6=company_ratings.collect(&:pride).count
  	 update_attributes(:attrib_pride => company_ratings.collect(&:pride).compact.sum.to_f/rating_size6)

  	 rating_size7=company_ratings.collect(&:opportunities).count
  	 update_attributes(:attrib_opportunities => company_ratings.collect(&:opportunities).compact.sum.to_f/rating_size7)

  	 
  	 rating_size8=company_ratings.collect(&:opinion).count
  	 update_attributes(:attrib_opinion => company_ratings.collect(&:opinion).compact.sum.to_f/rating_size8)

  	 rating_size9=company_ratings.collect(&:stimulatingjob).count
  	 update_attributes(:attrib_stimulatingjob => company_ratings.collect(&:stimulatingjob).compact.sum.to_f/rating_size9)

  	 rating_size10=company_ratings.collect(&:innovation).count
  	 update_attributes(:attrib_innovation => company_ratings.collect(&:innovation).compact.sum.to_f/rating_size10)

  	 rating_size11=company_ratings.collect(&:management).count
  	 update_attributes(:attrib_management => company_ratings.collect(&:management).compact.sum.to_f/rating_size11)

  	 rating_size12=company_ratings.collect(&:compensation).count
  	 update_attributes(:attrib_compensation => company_ratings.collect(&:compensation).compact.sum.to_f/rating_size12)

  	 rating_size13=company_ratings.collect(&:workload).count
  	 update_attributes(:attrib_workload=> company_ratings.collect(&:workload).compact.sum.to_f/rating_size13)

  	 rating_size14=company_ratings.collect(&:equality).count
  	 update_attributes(:attrib_equality => company_ratings.collect(&:equality).compact.sum.to_f/rating_size14)

  	 rating_size15=company_ratings.collect(&:objectives).count
  	 update_attributes(:attrib_objectives => company_ratings.collect(&:objectives).compact.sum.to_f/rating_size15)

  	 rating_size16=company_ratings.collect(&:cooperation).count
  	 update_attributes(:attrib_cooperation => company_ratings.collect(&:cooperation).compact.sum.to_f/rating_size16)


  	 rating_size17=company_ratings.collect(&:guidance).count
  	 update_attributes(:attrib_guidance => company_ratings.sum("guidance").to_f/rating_size17)
     #update_attributes(:attrib_guidance => company_ratings.collect(&:guidance).compact.sum.to_f/rating_size17)

  	 rating_size18=company_ratings.collect(&:reward).count
  	 update_attributes(:attrib_reward => company_ratings.collect(&:reward).compact.sum.to_f/rating_size18)


  	 rating_size19=company_ratings.collect(&:career).count
  	 update_attributes(:attrib_career => company_ratings.collect(&:career).compact.sum.to_f/rating_size19)


  	 rating_size20=company_ratings.collect(&:transparancy).count
  	 #attrib1= company_ratings.collect(&:transparancy).sum.to_f/rating_size20
  	 update_attributes(:attrib_transparancy=> company_ratings.collect(&:transparancy).compact.sum.to_f/rating_size20)
     
     review= rating_size+rating_size1+rating_size2+rating_size3+rating_size4+rating_size5+rating_size6+rating_size7+rating_size8+rating_size9+rating_size10+rating_size11+rating_size12+rating_size13+rating_size14+rating_size15+rating_size16+rating_size17+rating_size18+rating_size19+rating_size20
     update_attributes(:reviews => review)
     
     totalreview = company_ratings.count
     update_attributes(:totalreviews => totalreview)
  	# raise rating_size.inspect
      update_satisfaction
      update_rank
  end

  #after_update :update_satisfaction
  
 
  def update_satisfaction
  	 #review= self.reviews
  	 
  	 update_attributes(:satisfaction => ( attrib_satisfaction.to_i+attrib_work_environment.to_i+attrib_cd.to_i+attrib_flexibility.to_i++attrib_relation.to_i+attrib_leadership.to_i+attrib_pride.to_i+attrib_opportunities.to_i+attrib_opinion.to_i+attrib_stimulatingjob.to_i+attrib_innovation.to_i+attrib_management.to_i+attrib_compensation.to_i+attrib_workload.to_i+attrib_equality.to_i+attrib_objectives.to_i+attrib_cooperation.to_i+attrib_guidance+attrib_reward.to_i+attrib_career.to_i+attrib_transparancy.to_i)/self.reviews)
     #update_attributes(:reviews => company_ratings.count)
     #
     #raise review.inspect
  end
	 

	 def update_rank

	 	update_attributes(:rank => (satisfaction*100*totalreviews))

	 end  
end

