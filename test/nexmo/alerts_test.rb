require_relative './test'

class NexmoAlertsTest < Nexmo::Test
  def alerts
    Nexmo::Alerts.new(client)
  end

  def test_list_method
    uri = 'https://rest.nexmo.com/sc/us/alert/opt-in/query/json'

    request_stub = stub_request(:get, uri).with(query: api_key_and_secret).to_return(response)

    assert_equal response_object, alerts.list
    assert_requested request_stub
  end

  def test_remove_method
    uri = 'https://rest.nexmo.com/sc/us/alert/opt-in/manage/json'

    params = {msisdn: msisdn}

    request_stub = stub_request(:post, uri).with(headers: headers, body: params.merge(api_key_and_secret)).to_return(response)

    assert_equal response_object, alerts.remove(params)
    assert_requested request_stub
  end

  def test_resubscribe_method
    uri = 'https://rest.nexmo.com/sc/us/alert/opt-in/manage/json'

    params = {msisdn: msisdn}

    request_stub = stub_request(:post, uri).with(headers: headers, body: params.merge(api_key_and_secret)).to_return(response)

    assert_equal response_object, alerts.resubscribe(params)
    assert_requested request_stub
  end

  def test_send_method
    uri = 'https://rest.nexmo.com/sc/us/alert/json'

    params = {'to' => msisdn, 'status-report-req' => '1', 'server' => 'host3'}

    request_stub = stub_request(:post, uri).with(headers: headers, body: params.merge(api_key_and_secret)).to_return(response)

    assert_equal response_object, alerts.send(to: msisdn, status_report_req: 1, server: 'host3')
    assert_requested request_stub
  end
end
