class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 config.action_dispatch.session_store = :active_record_store 

	def after_sign_in_path_for(resources)
		if current_user.profile.blank?
			new_profile_path 
		else
			companies_path
			params[:company_id] ? company_path({:id=>params[:company_id]}) : companies_path
			#company_path({:id=>params[:company_id]}) 
             #session[:previous_url] || companies_path
			 
			#companies_path
		end

	end
 

	
end
