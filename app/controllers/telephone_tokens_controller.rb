class TelephoneTokensController < ApplicationController
  def create
    unless params[:telephone] =~ User::TELEPHONE_REGEX
      render json: { status: "error", message: "手机号码格式不正确！" }
      return
    end

    if session[:token_created_at] && session[:token_created_at] + 60 > Time.now.to_i
      render json: { status: "error", message: "请稍后再试！" }
      return
    end

    token = RandomCode.generate_mobile_phone_token
    VerifyToken.upsert params[:telephone], token
    SendSMS.send params[:telephone], "#{token} 验证码，注册"
    session[:token_created_at] = Time.now.to_i
    render json: { status: "ok" }
  end
end
