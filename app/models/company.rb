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
    #to find attrib1
     #rating_size=company_ratings.collect(&:satisfaction).compact.size
     
     if company_ratings.collect(&:satisfaction).compact.empty?
      attrb1 = nil
       rating_size=nil
      else
        rating_size=company_ratings.collect(&:satisfaction).compact.count
     attrb1= (company_ratings.collect(&:satisfaction).compact.sum.to_f/rating_size) 
     end
     update_attributes(:attrib_satisfaction => attrb1)

    #to find attrib2
    
     if company_ratings.collect(&:work_environment).compact.empty?
         attrb2 = nil
          rating_size1=nil
      else
         rating_size1=company_ratings.collect(&:work_environment).compact.count
         attrb2= (company_ratings.collect(&:work_environment).compact.sum.to_f/rating_size1 )
     end
     update_attributes(:attrib_work_environment => attrb2)
     
     #to find attrib3
     #rating_size2=company_ratings.collect(&:cd).compact.count
     if company_ratings.collect(&:cd).compact.empty?
      attrb3 = nil
      rating_size2=nil
    else
      rating_size2=company_ratings.collect(&:cd).compact.count
     attrb3= (company_ratings.collect(&:cd).compact.sum.to_f/rating_size2 )
   end

     update_attributes(:attrib_cd => attrb3)

     #To find attrib4

     
      if company_ratings.collect(&:flexibility).compact.empty?
         attrb4 = nil
         rating_size3=nil

      else
        rating_size3=company_ratings.collect(&:flexibility).compact.count
         attrb4 = (company_ratings.collect(&:flexibility).compact.sum.to_f/rating_size3 )
      end
     #attrb4 = (company_ratings.collect { |x| x.flexibility.to_i}.sum.to_f/rating_size3 )
     update_attributes(:attrib_flexibility => attrb4)
      

      #To find attrib5
     
     if company_ratings.collect(&:relation).compact.empty?
         attrb5 = nil
         rating_size4=nil
      else
        rating_size4=company_ratings.collect(&:relation).compact.count
        attrb5=(company_ratings.collect(&:relation).compact.sum.to_f/rating_size4 )
     end
     update_attributes(:attrib_relation => attrb5)


     #To find attrib6

     #rating_size5=company_ratings.collect(&:leadership).compact.count
     if company_ratings.collect(&:leadership).compact.empty?
         attrb6 = nil
         rating_size5=nil
      else
        rating_size5=company_ratings.collect(&:leadership).compact.count
         attrb6=(company_ratings.collect(&:leadership).compact.sum.to_f/rating_size5 ) 
     end
     update_attributes(:attrib_leadership => attrb6 )

     #To find attrib7

     
     if company_ratings.collect(&:pride).compact.empty?
         attrb7=nil
         rating_size6=nil
     else
      rating_size6=company_ratings.collect(&:pride).compact.count
       attrb7= (company_ratings.collect(&:pride).compact.sum.to_f/rating_size6 )
     end
     update_attributes(:attrib_pride => attrb7)

     #To find attrib8

     #rating_size7=company_ratings.collect(&:opportunities).compact.count

     if company_ratings.collect(&:opportunities).compact.empty?
        attrb8=nil
        rating_size7=nil
     else
        rating_size7=company_ratings.collect(&:opportunities).compact.count
        attrb8=(  company_ratings.collect(&:opportunities).compact.sum.to_f/rating_size7 )
     end
     update_attributes(:attrib_opportunities =>attrb8  )


     #To find attrib9

     
     
     if company_ratings.collect(&:opinion).compact.empty?
        attrb9=nil
        rating_size8=nil
      else
        rating_size8=company_ratings.collect(&:opinion).compact.count
         attrb9=(company_ratings.collect(&:opinion).compact.sum.to_f/rating_size8 )
      end
     update_attributes(:attrib_opinion => attrb9)


     #To find attrib10
     
    if company_ratings.collect(&:stimulatingjob).compact.empty?
      attrb10=nil
      rating_size9=nil
    else
      rating_size9=company_ratings.collect(&:stimulatingjob).compact.count
     attrb10=(company_ratings.collect(&:stimulatingjob).compact.sum.to_f/rating_size9 )
    end
     update_attributes(:attrib_stimulatingjob => attrb10 )

     #To find attrib11

     
     if company_ratings.collect(&:innovation).compact.empty?
      attrb11=nil
      rating_size10=nil
    else
      rating_size10=company_ratings.collect(&:innovation).compact.count
     attrb11=(company_ratings.collect(&:innovation).compact.sum.to_f/rating_size10 )
    end
     update_attributes(:attrib_innovation => attrb11 )


     #To find attrib12

     

     if company_ratings.collect(&:management).compact.empty?
      attrb12=nil
      rating_size11=nil
    else
      rating_size11=company_ratings.collect(&:management).compact.count
         attrb12=(company_ratings.collect(&:management).compact.sum.to_f/rating_size11 )
    end
     update_attributes(:attrib_management => attrb12)
     

     #To find attrib13


     

     if company_ratings.collect(&:compensation).compact.empty?
      attrb13=nil
      rating_size12=nil
    else
      rating_size12=company_ratings.collect(&:compensation).compact.count
     attrb13=(company_ratings.collect(&:compensation).compact.sum.to_f/rating_size12 )
    end
     update_attributes(:attrib_compensation => attrb13)

     
     #To find attrib14
     
     if company_ratings.collect(&:workload).compact.empty?
      attrb14=nil
      rating_size13=nil
    else
      rating_size13=company_ratings.collect(&:workload).compact.count
     attrb14=(company_ratings.collect(&:workload).compact.sum.to_f/rating_size13 )
    end
     update_attributes(:attrib_workload=> attrb14)


     #To find attrib15

     
     if company_ratings.collect(&:equality).compact.empty?
      attrb15=nil
      rating_size14=nil
    else
      rating_size14=company_ratings.collect(&:equality).compact.count
     attrb15=(company_ratings.collect(&:equality).compact.sum.to_f/rating_size14 )
    end
     update_attributes(:attrib_equality => attrb15)

     #To find attrib16

     
     if company_ratings.collect(&:objectives).compact.empty?
      attrb16=nil
      rating_size15=nil
    else
      rating_size15=company_ratings.collect(&:objectives).compact.count
      attrb16=(company_ratings.collect(&:objectives).compact.sum.to_f/rating_size15 )
    end
     update_attributes(:attrib_objectives => attrb16)

     #To find attrib17

     
     if company_ratings.collect(&:cooperation).compact.empty?
      attrb17 = nil
      rating_size16=nil
    else
      rating_size16=company_ratings.collect(&:cooperation).compact.count
     attrb17=(company_ratings.collect(&:cooperation).compact.sum.to_f/rating_size16 )
    end
     update_attributes(:attrib_cooperation => attrb17 )


     #To find attrib18


     

     if company_ratings.collect(&:guidance).compact.empty?
      attrb18= nil
      rating_size17=nil
    else
      rating_size17=company_ratings.collect(&:guidance).compact.count
      attrb18=(company_ratings.collect(&:guidance).compact.sum.to_f/rating_size17 )
    end
     update_attributes(:attrib_guidance => attrb18)
     #update_attributes(:attrib_guidance => (  company_ratings.collect(&:guidance).compact.sum.to_f/rating_size17)
     #company_ratings.sum("guidance").to_f
     

     #To find attrib19
     

     if company_ratings.collect(&:reward).compact.empty?
      attrib19=nil
      rating_size18=nil
    else
      rating_size18=company_ratings.collect(&:reward).compact.count
     attrb19=(company_ratings.collect(&:reward).compact.sum.to_f/rating_size18 )
   end
     update_attributes(:attrib_reward =>  attrb19)

     #To find attrib20
     
     if company_ratings.collect(&:career).compact.empty?
      attrb20=nil
      rating_size19=nil
    else
      rating_size19=company_ratings.collect(&:career).compact.count
     attrb20=(company_ratings.collect(&:career).compact.sum.to_f/rating_size19 )
    end
     update_attributes(:attrib_career => attrb20 )

     #To find attrib21
     
     #rating_size20=company_ratings.collect(&:transparancy).compact.count
     if company_ratings.collect(&:transparancy).compact.empty?
       attrb21=nil
       rating_size20 = nil
     else
       rating_size20=company_ratings.collect(&:transparancy).compact.count
       attrb21= (  company_ratings.collect(&:transparancy).compact.sum.to_f/rating_size20  )
      end
     update_attributes(:attrib_transparancy=> attrb21 )
     

     #raise attrb1.inspect 
     #not sum count 

     counting= [rating_size,rating_size1,rating_size2,rating_size3,rating_size4,rating_size5,rating_size6,rating_size7,rating_size8,rating_size9,rating_size10,rating_size11,rating_size12,rating_size13,rating_size14,rating_size15,rating_size16,rating_size17,rating_size18,rating_size19,rating_size20]
     review = counting.compact.count
     #raise review.inspect
     #review= rating_size+rating_size1+rating_size2+rating_size3+rating_size4+rating_size5+rating_size6+rating_size7+rating_size8+rating_size9+rating_size10+rating_size11+rating_size12+rating_size13+rating_size14+rating_size15+rating_size16+rating_size17+rating_size18+rating_size19+rating_size20
     update_attributes(:reviews =>   review)
     
     totalreview = company_ratings.count
     update_attributes(:totalreviews => totalreview)
    #raise rating_size1.inspect
      update_satisfaction
      update_rank

  end

  #after_update :update_satisfaction
  
 
  def update_satisfaction
     review= self.reviews
     #raise review.inspect
     score = ((attrib_satisfaction.to_f+attrib_work_environment.to_f+attrib_cd.to_f+attrib_flexibility.to_f+attrib_relation.to_f+attrib_leadership.to_f+attrib_pride.to_f+attrib_opportunities.to_f+attrib_opinion.to_f+attrib_stimulatingjob.to_f+attrib_innovation.to_f+attrib_management.to_f+attrib_compensation.to_f+attrib_workload.to_f+attrib_equality.to_f+attrib_objectives.to_f+attrib_cooperation.to_f+attrib_guidance.to_f+attrib_reward.to_f+attrib_career.to_f+attrib_transparancy.to_f)/self.reviews).round
     update_attributes(:satisfaction => score)
     #update_attributes(:reviews => company_ratings.count)
     #
     #raise check.inspect
     
  end
   

   def update_rank

    update_attributes(:rank => (satisfaction*100*totalreviews))

   end  
end
