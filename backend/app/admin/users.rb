ActiveAdmin.register User do

  permit_params :firstName, :lastName, :email, :phoneNumber, :referredCodeKey, :agreeToPrivacyPolicy, :token, :source, :wrongOTPCount, :wrongEmailVerificationCount
  
end
