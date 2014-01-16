class CompaniesController < ApplicationController
  before_action :authenticate_user! , :except => [:index]
  

  def index
    @companies = Company.all
    #@companies = CompanyRating.select('company_id,avg(satisfaction+work_environment+cd+flexibility+relation+leadership+pride+opportunities+opinion+stimulatingjob+innovation+management+compensation+workload+equality+objectives+cooperation+guidance+reward+career+transparancy) as rating, COUNT(DISTINCT(user_id,company_id)) as rank').group('company_id').order("rank DESC, rating ASC") 
    #count = CompanyRating.count      
    #@companies = CompanyRating.select('company_id,avg(satisfaction+work_environment+cd+flexibility+relation+leadership+pride+opportunities+opinion+stimulatingjob+innovation+management+compensation+workload+equality+objectives+cooperation+guidance+reward+career+transparancy) as rating, COUNT(DISTINCT(user_id,company_id)) as rank').group('company_id').order("coalesce('rank', #{count}) ASC")
    #@companies=CompanyRating.select('avg(satisfaction+work_environment+cd+flexibility+relation+leadership+pride+opportunities+opinion+stimulatingjob+innovation+management+compensation+workload+equality+objectives+cooperation+guidance+reward+career+transparancy) as rating,COUNT(DISTINCT(user_id,company_id)) as rank').order('rank')
  end

 
  def show
    @company = Company.find(params[:id])
    company_rating = CompanyRating.where(:company_id =>@company.id)
    rating_size = company_rating.size
    @avg_satisfaction = company_rating.collect(&:satisfaction).sum.to_f/rating_size
    @avg_work_environment = company_rating.collect(&:work_environment).sum.to_f/rating_size
    @avg_cd = company_rating.collect(&:cd).sum.to_f/rating_size
    @avg_flexibility = company_rating.collect(&:flexibility).sum.to_f/rating_size
    @avg_relation = company_rating.collect(&:relation).sum.to_f/rating_size
    @avg_leadership = company_rating.collect(&:leadership).sum.to_f/rating_size
    @avg_pride = company_rating.collect(&:pride).sum.to_f/rating_size
    @avg_opportunities = company_rating.collect(&:opportunities).sum.to_f/rating_size
    @avg_opinion = company_rating.collect(&:opinion).sum.to_f/rating_size
    @avg_stimulatingjob = company_rating.collect(&:stimulatingjob).sum.to_f/rating_size
    @avg_innovation = company_rating.collect(&:innovation).sum.to_f/rating_size
    @avg_management= company_rating.collect(&:management).sum.to_f/rating_size
    @avg_compensation = company_rating.collect(&:compensation).sum.to_f/rating_size
    @avg_workload = company_rating.collect(&:workload).sum.to_f/rating_size
    @avg_equality = company_rating.collect(&:equality).sum.to_f/rating_size
    @avg_objectives= company_rating.collect(&:objectives).sum.to_f/rating_size
    @avg_cooperation = company_rating.collect(&:cooperation).sum.to_f/rating_size
    @avg_guidance = company_rating.collect(&:guidance).sum.to_f/rating_size
    @avg_reward = company_rating.collect(&:reward).sum.to_f/rating_size
    @avg_career = company_rating.collect(&:career).sum.to_f/rating_size
    @avg_transparancy = company_rating.collect(&:transparancy).sum.to_f/rating_size
   
    @count= company_rating.count
   @total= (@avg_satisfaction+@avg_work_environment+@avg_cd+@avg_flexibility+@avg_relation+@avg_leadership+@avg_pride+@avg_opportunities+@avg_opinion+@avg_stimulatingjob+@avg_innovation+@avg_management+@avg_compensation+@avg_workload+@avg_equality+@avg_objectives+@avg_cooperation+@avg_guidance+@avg_reward+@avg_career+@avg_transparancy)/21
  #arr= @avg_satisfaction+@avg_work_environment+@avg_cd+@avg_flexibility+@avg_relation+@avg_leadership+@avg_pride+@avg_opportunities+@avg_opinion+@avg_stimulatingjob+@avg_innovation+@avg_management+@avg_compensation+@avg_workload+@avg_equality+@avg_objectives+@avg_cooperation+@avg_guidance+@avg_reward+@avg_career+@avg_transparancy
    

    #@total = arr.inject{ |sum, el| sum + el }.to_f / arr.size
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
