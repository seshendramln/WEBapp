class CompaniesController < ApplicationController
  before_action :authenticate_user! , :only => [:show]
  #, :except => [:index] 
  
  

  def index
    @companies = Company.all.order('rank DESC NULLS LAST')
    #@companies = CompanyRating.select('company_id,avg(satisfaction+work_environment+cd+flexibility+relation+leadership+pride+opportunities+opinion+stimulatingjob+innovation+management+compensation+workload+equality+objectives+cooperation+guidance+reward+career+transparancy) as rating, COUNT(DISTINCT(user_id,company_id)) as rank').group('company_id').order("rank DESC, rating ASC") 
    #count = CompanyRating.count      
    #@companies = CompanyRating.select('company_id,avg(satisfaction+work_environment+cd+flexibility+relation+leadership+pride+opportunities+opinion+stimulatingjob+innovation+management+compensation+workload+equality+objectives+cooperation+guidance+reward+career+transparancy) as rating, COUNT(DISTINCT(user_id,company_id)) as rank').group('company_id').order("coalesce('rank', #{count}) ASC")
    #@companies=CompanyRating.select('avg(satisfaction+work_environment+cd+flexibility+relation+leadership+pride+opportunities+opinion+stimulatingjob+innovation+management+compensation+workload+equality+objectives+cooperation+guidance+reward+career+transparancy) as rating,COUNT(DISTINCT(user_id,company_id)) as rank').order('rank')
  end

 
  def show
    @company = Company.find(params[:id])
    #@article.user_id = current_user.id 
    company_rating = CompanyRating.where( :company_id =>@company.id,
                                          :user_id => current_user.id ) 
    #rating_size = company_rating.size

    
    @avg_satisfaction = company_rating.collect(&:satisfaction)
    @avg_work_environment = company_rating.collect(&:work_environment)
    @avg_cd = company_rating.collect(&:cd)
    @avg_flexibility = company_rating.collect(&:flexibility)
    @avg_relation = company_rating.collect(&:relation)

    @avg_leadership = company_rating.collect(&:leadership)

     rating_size6=company_rating.collect(&:pride).count
    @avg_pride = (company_rating.collect(&:pride))
    @avg_opportunities = company_rating.collect(&:opportunities)
    @avg_opinion = company_rating.collect(&:opinion)
    @avg_stimulatingjob = company_rating.collect(&:stimulatingjob)
    #@avg_stimulatingjob = (company_rating.collect(&:stimulatingjob).compact.sum.to_i/rating_size if company_rating.blank?)
    @avg_innovation = company_rating.collect(&:innovation)
    @avg_management= company_rating.collect(&:management)
    @avg_compensation = company_rating.collect(&:compensation)
    @avg_workload = company_rating.collect(&:workload)
    @avg_equality = company_rating.collect(&:equality)
    @avg_objectives= company_rating.collect(&:objectives)
    @avg_cooperation = company_rating.collect(&:cooperation)
    @avg_guidance = company_rating.collect(&:guidance)
    @avg_reward = company_rating.collect(&:reward)
    @avg_career = company_rating.collect(&:career)
    @avg_transparancy = company_rating.collect(&:transparancy)
    
    #arr= [avg_satisfaction,@avg_work_environment,@avg_cd,@avg_flexibility,@avg_relation,@avg_leadership,@avg_pride,@avg_opportunities,@avg_opinion,@avg_stimulatingjob,@avg_innovation,@avg_management,@avg_compensation,@avg_workload,@avg_equality,@avg_objectives,@avg_cooperation,@avg_guidance,@avg_reward,@avg_career,@avg_transparancy]
    #@current_user_satisfaction = @avg_satisfaction+@avg_work_environment+@avg_cd+@avg_flexibility+@avg_relation+@avg_leadership+@avg_pride+@avg_opportunities+@avg_opinion+@avg_stimulatingjob+@avg_innovation+@avg_management+@avg_compensation+@avg_workload+@avg_equality+@avg_objectives+@avg_cooperation+@avg_guidance+@avg_reward+@avg_career+@avg_transparancy).compact/21
    arr= @avg_satisfaction+@avg_work_environment+@avg_cd+@avg_flexibility+@avg_relation+@avg_leadership+@avg_pride+@avg_opportunities+@avg_opinion+@avg_stimulatingjob+@avg_innovation+@avg_management+@avg_compensation+@avg_workload+@avg_equality+@avg_objectives+@avg_cooperation+@avg_guidance+@avg_reward+@avg_career+@avg_transparancy
     @current_user_satisfaction = arr.flatten.compact.sum / arr.flatten.compact.size if arr.flatten.compact.present?
     #size = arr.compact.size
    #total= avg_satisfaction+avg_work_environment+avg_cd+avg_flexibility+avg_relation+avg_leadership+avg_pride+avg_opportunities+avg_opinion+avg_stimulatingjob+avg_innovation+avg_management+avg_compensation+avg_workload+avg_equality+avg_objectives+avg_cooperation+avg_guidance+avg_reward+avg_career+avg_transparancy
   #raise size.inspect 
   #@total= (@avg_satisfaction+@avg_work_environment+@avg_cd+@avg_flexibility+@avg_relation+@avg_leadership+@avg_pride+@avg_opportunities+@avg_opinion+@avg_stimulatingjob+@avg_innovation+@avg_management+@avg_compensation+@avg_workload+@avg_equality+@avg_objectives+@avg_cooperation+@avg_guidance+@avg_reward+@avg_career+@avg_transparancy).compact/21
  #arr= @avg_satisfaction+@avg_work_environment+@avg_cd+@avg_flexibility+@avg_relation+@avg_leadership+@avg_pride+@avg_opportunities+@avg_opinion+@avg_stimulatingjob+@avg_innovation+@avg_management+@avg_compensation+@avg_workload+@avg_equality+@avg_objectives+@avg_cooperation+@avg_guidance+@avg_reward+@avg_career+@avg_transparancy
   #(company.attrib_satisfaction+company.attrib_work_environment+company.attrib_cd+company.attrib_flexibility+company.attrib_relation+company.attrib_leadership+company.attrib_pride+company.attrib_opportunities+company.attrib_opinion+company.attrib_stimulatingjob+company.attrib_innovation+company.attrib_management+company.attrib_compensation+company.attrib_workload+company.attrib_equality+company.attrib_objectives+company.attrib_cooperation+company.attrib_guidance+company.attrib_reward+company.attrib_career+company.attrib_transparancy)/company.reviews 

    #@total = arr.inject{ |sum, el| sum + el }.to_i / arr.size
  end

 

 
  def new
    @company = Company.new
end

  def create
    @company = Company.new(comp_params)
    if @company.save
      
      flash[:success] = "Welcome to skillable"
      redirect_to root_url
    else
      render 'new'
    end
  end
  

  private

  def comp_params
    params.require(:company).permit(:name, :place, :Description,:logo)
  end

end
