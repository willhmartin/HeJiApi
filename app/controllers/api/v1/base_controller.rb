class Api::V1::BaseController < ActionController::Base

  rescue_from StandardError,                with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def token_request
      token_params = {
        appId: ENV['WECHAT_APP_ID'],
        secret: ENV['WECHAT_APP_SECRET'],
        grant_type: "client_credential"
      }
      @wechat_response ||= RestClient.get("https://api.weixin.qq.com/cgi-bin/token", params: token_params)
      @getToken ||= JSON.parse(@wechat_response.body)
  end

  def content_check(string1, string2 = '', string3 = '', string4 = '')
    getToken_res = token_request
    content_for_checking = string1 + string2 + string3 + string4
    if getToken_res["access_token"].present?
      token = getToken_res.fetch("access_token")
      @msg_check_response ||= RestClient.post "https://api.weixin.qq.com/wxa/msg_sec_check?access_token=#{token}", {content: content_for_checking }.to_json
      @msg_check ||= JSON.parse(@msg_check_response.body)
    return @msg_check.fetch("errcode")
    end
  end

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def internal_server_error(exception)
    if Rails.env.development?
      response = { type: exception.class.to_s, error: exception.message }
    else
      response = { error: "Internal Server Error" }
    end
    render json: response, status: :internal_server_error
  end
end
