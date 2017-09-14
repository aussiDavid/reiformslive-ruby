module REIformslive
  class Session
    require 'faraday'

    BASE_URL = 'https://sa-api.staging.reiformslive.com.au'.freeze

    def token
      post['token']
    end

    def post path: '/session'
      connection
        .post(path)
        .body
        .parse_json
    end

    def connection
      conn = Faraday.new BASE_URL
      conn.basic_auth '4b66ff95-ade7-413e-b086-0044de7b4ccf', 'ae7e5a1b-e85d-43c4-8d01-fd5cb47d7044'
      conn
    end
  end
end
