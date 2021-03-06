require 'json'
require 'byebug'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie_json = req.cookies['_rails_lite_app']
    @cookie = cookie_json ? JSON.parse(cookie_json) : {}
    @cookie[:path] = '/'
  end

  def [](key)
    # debugger
    @cookie[key]
  end

  def []=(key, val)
    # debugger
    @cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie('_rails_lite_app', @cookie.to_json)
  end
end
