class ReferralsController < ApplicationController
    before_action :verify_authenticity_token, :only => [:no_method]
    before_action :validate_token, :only => [:show, :referral_code_user]

    def show
        referralCode = Referral.find_by(user_id: @user.id)
        render json: {referralCode: referralCode.code}, status: :ok
    end

    def referral_code_user
        referralUser = Referral.find_by(code: params[:code]) rescue false
        if referralUser.present?
            render json: {referralUser: referralUser.user, isValidReferral: true, errors: []}, status: :ok
        else
            render json: {referralUser: nil, isValidReferral: false, errors: ["Invalid Referral Code."]}, status: 401
        end
    end

    private
        def validate_token
            token = params[:token]
            phoneNumber = params[:phoneNumber]
            email = params[:email]
            @user = User.find_by(token: token) rescue false
            if !@user.present?
                render json: {isEmailVerification: false, message: "", errors: ["Invalid User"]}, status: 401
            elsif (email.present? && @user.email != email) || (phoneNumber.present? && @user.phoneNumber != phoneNumber)
                render json: {isEmailVerification: false, message: "", errors: ["Invalid Credentials."]}, status: 401
            else
                @user
            end
        end

end
