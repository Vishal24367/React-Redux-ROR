Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/users/phone' => 'users#phone_number_verify'
  post '/users/phone/verify' => 'users#verify_otp'
  post '/users/email' => 'users#email_verification'
  post '/users' => 'users#create'
  post '/users/email/verify' => 'users#verify_email'
  put '/users/token/resendtoken' => 'users#resend_email_token'
  put '/users/otp/resend' => 'users#resend_otp'
  get '/users/my_referral' => 'referrals#show'
  put '/users/referral/' => 'referrals#referral_code_user'
end
