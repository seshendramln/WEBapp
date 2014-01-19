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
     attrb1= (company_ratings.collect(&:satisfaction).compact.sum.to_f/rating_size) 
  	 update_attributes(:attrib_satisfaction => attrb1)
 
     rating_size1=company_ratings.collect(&:work_environment).count
     attrb2= (company_ratings.collect(&:work_environment).compact.sum.to_f/rating_size1 )
  	 update_attributes(:attrib_work_environment => attrb2)

  	 rating_size2=company_ratings.collect(&:cd).count
     attrb3= (company_ratings.collect(&:cd).compact.sum.to_f/rating_size2 )
  	 update_attributes(:attrib_cd => attrb3)

  	 rating_size3=company_ratings.collect(&:flexibility).count
     attrb4 = (company_ratings.collect { |x| x.flexibility.to_i}.sum.to_f/rating_size3 )
  	 update_attributes(:attrib_flexibility => attrb4)

  	 rating_size4=company_ratings.collect(&:relation).count
     attrb5=(company_ratings.collect(&:relation).compact.sum.to_f/rating_size4 )
  	 update_attributes(:attrib_relation => attrb5)

  	 rating_size5=company_ratings.collect(&:leadership).count
     attrb6=(company_ratings.collect(&:leadership).compact.sum.to_f/rating_size5 ) 
  	 update_attributes(:attrib_leadership => attrb6 )

  	 rating_size6=company_ratings.collect(&:pride).count
     attrb7= (company_ratings.collect(&:pride).compact.sum.to_f/rating_size6 )
  	 update_attributes(:attrib_pride => attrb7)

  	 rating_size7=company_ratings.collect(&:opportunities).count
     attrb8=(  company_ratings.collect(&:opportunities).compact.sum.to_f/rating_size7 )
  	 update_attributes(:attrib_opportunities =>attrb8  )

  	 
  	 rating_size8=company_ratings.collect(&:opinion).count
     attrb9=(company_ratings.collect(&:opinion).compact.sum.to_f/rating_size8 )
  	 update_attributes(:attrib_opinion => attrb9)

  	 rating_size9=company_ratings.collect(&:stimulatingjob).count
     attrb10=(company_ratings.collect(&:stimulatingjob).compact.sum.to_f/rating_size9 )
  	 update_attributes(:attrib_stimulatingjob => attrb10 )

  	 rating_size10=company_ratings.collect(&:innovation).count
     attrb11=(company_ratings.collect(&:innovation).compact.sum.to_f/rating_size10 )
  	 update_attributes(:attrib_innovation => attrb11 )

  	 rating_size11=company_ratings.collect(&:management).count
     attrb12=(company_ratings.collect(&:management).compact.sum.to_f/rating_size11 )
  	 update_attributes(:attrib_management => attrb12)

  	 rating_size12=company_ratings.collect(&:compensation).count
     attrb13=(company_ratings.collect(&:compensation).compact.sum.to_f/rating_size12 )
  	 update_attributes(:attrib_compensation => attrb13)

  	 rating_size13=company_ratings.collect(&:workload).count
     attrb14=(company_ratings.collect(&:workload).compact.sum.to_f/rating_size13 )
  	 update_attributes(:attrib_workload=> attrb14)

  	 rating_size14=company_ratings.collect(&:equality).count
     attrb15=(company_ratings.collect(&:equality).compact.sum.to_f/rating_size14 )
  	 update_attributes(:attrib_equality => attrb15)

  	 rating_size15=company_ratings.collect(&:objectives).count
     attrb16=(company_ratings.collect(&:objectives).compact.sum.to_f/rating_size15 )
  	 update_attributes(:attrib_objectives => attrb16)

  	 rating_size16=company_ratings.collect(&:cooperation).count
     attrb17=(company_ratings.collect(&:cooperation).compact.sum.to_f/rating_size16 )
  	 update_attributes(:attrib_cooperation => attrb17 )


  	 rating_size17=company_ratings.collect(&:guidance).count
     attrb18=(company_ratings.sum("guidance").to_f/rating_size17 )
  	 update_attributes(:attrib_guidance => attrb18)
     #update_attributes(:attrib_guidance => (  company_ratings.collect(&:guidance).compact.sum.to_f/rating_size17)

  	 rating_size18=company_ratings.collect(&:reward).count
     attrb19=(company_ratings.collect(&:reward).compact.sum.to_f/rating_size18 )
  	 update_attributes(:attrib_reward =>  attrb19)


  	 rating_size19=company_ratings.collect(&:career).count
     attrb20=(company_ratings.collect(&:career).compact.sum.to_f/rating_size19 )
  	 update_attributes(:attrib_career => attrb20 )


  	 rating_size20=company_ratings.collect(&:transparancy).count
  	 attrb21= (  company_ratings.collect(&:transparancy).compact.sum.to_f/rating_size20  )
  	 update_attributes(:attrib_transparancy=> attrb21 )
     #raise attrb3.inspect
     review= rating_size+rating_size1+rating_size2+rating_size3+rating_size4+rating_size5+rating_size6+rating_size7+rating_size8+rating_size9+rating_size10+rating_size11+rating_size12+rating_size13+rating_size14+rating_size15+rating_size16+rating_size17+rating_size18+rating_size19+rating_size20
     update_attributes(:reviews =>   review)
     
     totalreview = company_ratings.count
     update_attributes(:totalreviews => totalreview)
  	# raise rating_size.inspect
      update_satisfaction
      update_rank

  end

  #after_update :update_satisfaction
  
 
  def update_satisfaction
  	 review= self.reviews
  	 #raise review.inspect
  	 update_attributes(:satisfaction => (attrib_satisfaction.to_i+attrib_work_environment.to_i+attrib_cd.to_i+attrib_flexibility.to_i+attrib_relation.to_i+attrib_leadership.to_i+attrib_pride.to_i+attrib_opportunities.to_i+attrib_opinion.to_i+attrib_stimulatingjob.to_i+attrib_innovation.to_i+attrib_management.to_i+attrib_compensation.to_i+attrib_workload.to_i+attrib_equality.to_i+attrib_objectives.to_i+attrib_cooperation.to_i+attrib_guidance.to_i+attrib_reward.to_i+attrib_career.to_i+attrib_transparancy.to_i)/self.reviews)
     #update_attributes(:reviews => company_ratings.count)
     #
     
  end
	 

	 def update_rank

	 	update_attributes(:rank => (satisfaction*100*totalreviews))

	 end  
end

