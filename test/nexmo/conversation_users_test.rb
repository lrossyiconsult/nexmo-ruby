require_relative './test'

class NexmoConversationUsersTest < Nexmo::Test
  def users
    Nexmo::ConversationUsers.new(client)
  end

  def users_uri
    'https://api.nexmo.com/beta/users'
  end

  def user_uri
    'https://api.nexmo.com/beta/users/' + user_id
  end

  def user_id
    'xxx'
  end

  def params
    {display_name: 'My User Name'}
  end

  def test_create_method
    request_stub = stub_request(:post, users_uri).with(request(body: params)).to_return(response)

    assert_equal response_object, users.create(params)
    assert_requested request_stub
  end

  def test_list_method
    request_stub = stub_request(:get, users_uri).with(request).to_return(response)

    assert_equal response_object, users.list
    assert_requested request_stub
  end

  def test_get_method
    request_stub = stub_request(:get, user_uri).with(request).to_return(response)

    assert_equal response_object, users.get(user_id)
    assert_requested request_stub
  end

  def test_update_method
    request_stub = stub_request(:put, user_uri).with(request(body: params)).to_return(response)

    assert_equal response_object, users.update(user_id, params)
    assert_requested request_stub
  end

  def test_delete_method
    request_stub = stub_request(:delete, user_uri).with(request).to_return(response)

    assert_equal response_object, users.delete(user_id)
    assert_requested request_stub
  end
end
