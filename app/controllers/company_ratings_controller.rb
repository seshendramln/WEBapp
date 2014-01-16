class CompanyRatingsController < ApplicationController
  before_action :set_company_rating, only: [:show, :edit, :update, :destroy]

  # GET /company_ratings
  # GET /company_ratings.json
  def index
    @company_ratings = CompanyRating.all
  end

  # GET /company_ratings/1
  # GET /company_ratings/1.json
  def show
  end

  # GET /company_ratings/new
  def new
    @company_rating = CompanyRating.new
  end

  # GET /company_ratings/1/edit
  def edit
  end

  # POST /company_ratings
  # POST /company_ratings.json
  def create
    # debugger
    @company_rating = current_user.company_ratings.new(company_rating_params)

    # respond_to do |format|
      if @company_rating.save
        flash[:notice] = 'Company rating was successfully created.'
        redirect_to company_path(session[:company_id])
        # format.html { redirect_to @company_rating, notice: 'Company rating was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @company_rating }
      else
        render action: 'new' ,:layout => false
        # format.html { render action: 'new' }
        # format.json { render json: @company_rating.errors, status: :unprocessable_entity }
      end
    # end
  end




  # PATCH/PUT /company_ratings/1
  # PATCH/PUT /company_ratings/1.json
  def update
    respond_to do |format|
      if @company_rating.update(company_rating_params)
        format.html { redirect_to @company_rating, notice: 'Company rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_ratings/1
  # DELETE /company_ratings/1.json
  def destroy
    @company_rating.destroy
    respond_to do |format|
      format.html { redirect_to company_ratings_url }
      format.json { head :no_content }
    end
  end

  def user_rating   
    company_id = current_user.profile.companies.map(&:id)
    #rating = current_user.company_ratings.find(:all,:conditions=>["user_id = ? and company_id IN (?)",current_user.id,company_id])
    rating = current_user.company_ratings.where("user_id = ? and company_id IN (?)",current_user.id,company_id)
    if rating.size !=company_id.size
      if session[:company_id].blank?
        session[:company_id] = params[:company_id] 
        render :json=>"redirect".to_json
      else
        company_id = company_id - rating.map(&:company_id)
        @company_rating = current_user.company_ratings.new(:company_id=>company_id.first)
        @company = Company.find(company_id.first)
        session[:company_id] = params[:company_id]
        render :layout =>false
      end
    else
      session[:company_id] = nil
      render :json => "redirect".to_json
      # redirect_to company_path(params[:company_id])
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_rating
      @company_rating = CompanyRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_rating_params
      params.require(:company_rating).permit(:user_id, :company_id, :satisfaction, :work_environment, :cd, :flexibility, :relation,  :leadership, :pride,  :opportunities,  :opinion,  :stimulatingjob,  :innovation,  :management,  :compensation,  :workload,  :equality,  :objectives,  :cooperation,  :guidance,  :reward,  :career,  :transparancy)
    end
end
