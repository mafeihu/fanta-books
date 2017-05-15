class Api::QiniuController < ActionController::API

  # https://developer.qiniu.com/kodo/manual/1206/put-policy
  def index
    put_policy = Qiniu::Auth::PutPolicy.new(ENV['QINIU_BUCKET'])
    uptoken = Qiniu::Auth.generate_uptoken(put_policy)
    expires_now
    render json: {uptoken: uptoken}
  end
  
end
