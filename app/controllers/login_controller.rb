class LoginController < ApplicationController
skip_before_action :verify_authenticity_token
URL = "https://api.weixin.qq.com/sns/jscode2session".freeze


  def wechat_user
    @wechat_params = {
      appId: ENV["WECHAT_APP_ID"],
      secret: ENV["WECHAT_APP_SECRET"],
      js_code: params[:code],
      grant_type: "authorization_code"
    }
    @wechat_response ||= RestClient.get(URL, params: @wechat_params)
    wechat_res_body ||= JSON.parse(@wechat_response.body)
  end

  def login
    res_from_wechat = wechat_user
    p " testing"

    if res_from_wechat["openid"].present?
      openid = res_from_wechat.fetch("openid")
      @user = User.find_by(open_id: openid)
      unless @user.present?
        @user = User.new(open_id: openid, name: "placeholder")
        @user.save!
      end
      render json: {
        userId: @user.id
      }
    else 
      render json: wechat_user
    end
  end

end
