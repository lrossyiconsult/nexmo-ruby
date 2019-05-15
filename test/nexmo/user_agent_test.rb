require_relative './test'

class NexmoUserAgentTest < Minitest::Test
  UserAgent = Nexmo.const_get(:UserAgent)

  def app_name
    'ExampleApp'
  end

  def app_version
    'X.Y.Z'
  end

  def test_string_method
    string = UserAgent.string(app_name, app_version)

    assert_equal string, "nexmo-ruby/#{Nexmo::VERSION} ruby/#{RUBY_VERSION} #{app_name}/#{app_version}"
  end
end
