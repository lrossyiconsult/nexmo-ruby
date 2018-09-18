# frozen_string_literal: true

module Nexmo
  class Verify < Namespace
    alias_method :http_request, :request

    def request(params)
      post('/verify/json', params)
    end

    def check(params)
      post('/verify/check/json', params)
    end

    def search(params)
      VerifyResponse.new(http_request('/verify/search/json', params: params))
    end

    def control(params)
      post('/verify/control/json', params)
    end

    def cancel(id)
      control(request_id: id, cmd: 'cancel')
    end

    def trigger_next_event(id)
      control(request_id: id, cmd: 'trigger_next_event')
    end

    private

    def post(path, params)
      VerifyResponse.new(http_request(path, params: params, type: Post))
    end
  end
end
