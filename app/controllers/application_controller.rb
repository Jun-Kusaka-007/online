class ApplicationController < ActionController::Base
    include SessionsHelper
 
    private
 
    def login_please
         unless logged_in?
           redirect_to login_url, notice: 'Please log in.'
         end
    end
 
    def login_now
         if logged_in?
             redirect_to "/users/#{@current_user.id}", notice: 'login now.'
         end
    end
 
    def edit_user_only
        unless current_user.id == params[:id].to_i
        # flash[:notice] = "not ather edit"
         redirect_to "/users/#{@current_user.id}", notice: 'Not ather edit.'
        end
    end
 
    def admin_user
        unless current_user.admin == true
          redirect_to "/users/#{current_user.id}", notice: "権限がありません"
        end
    end
 end
 