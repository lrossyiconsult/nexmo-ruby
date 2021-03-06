require_relative './test'

class NexmoCallDTMFTest < Nexmo::Test
  def dtmf
    Nexmo::CallDTMF.new(client)
  end

  def uri
    'https://api.nexmo.com/v1/calls/' + call_uuid + '/dtmf'
  end

  def test_send_method
    params = {digits: '1234'}

    request_stub = stub_request(:put, uri).with(request(body: params)).to_return(response)

    assert_equal response_object, dtmf.send(call_uuid, params)
    assert_requested request_stub
  end
end
