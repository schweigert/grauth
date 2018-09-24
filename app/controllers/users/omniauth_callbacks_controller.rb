module Users
 class OmniauthCallbacksController < Devise::OmniauthCallbacksController
   def google_oauth2
     @user = User.from_omniauth(request.env['omniauth.auth'])

     @user.persisted? ? google_oauth2_success : google_oauth2_errors
   end

   private

   def google_oauth2_success
     sign_in_and_redirect(@user, event: :authentication)
   end

   def google_oauth2_errors
     session['devise.google_data'] = request.env['omniauth.auth'].to_h.except(:extra)
     redirect_to(new_user_registration_url)
   end
 end
end
