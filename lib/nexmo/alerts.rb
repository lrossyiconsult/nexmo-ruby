# frozen_string_literal: true

module Nexmo
  class Alerts < Namespace
    include Keys

    self.host = 'rest.nexmo.com'

    # Request the list of phone numbers opted out from your campaign.
    #
    # @see https://developer.nexmo.com/api/sms/us-short-codes/alerts/subscription
    #
    # @return [Entity]
    #
    def list
      request('/sc/us/alert/opt-in/query/json')
    end

    # Remove a phone number from the opt-out list.
    #
    # @option params [required, String] :msisdn The phone number to resubscribe to your campaign and remove from the opt-out list
    #
    # @param [Hash] params
    #
    # @return [Entity]
    #
    # @see https://developer.nexmo.com/api/sms/us-short-codes/alerts/subscription
    #
    def remove(params)
      request('/sc/us/alert/opt-in/manage/json', params: params, type: Post)
    end

    alias_method :resubscribe, :remove

    # Send an alert to your user.
    #
    # @option params [required, String] :to The single phone number to send pin to
    # @option params [Integer] :status_report_req Set to 1 to receive a delivery receipt
    # @option params [String] :client_ref A 40 character reference string for your internal reporting
    # @option params [Integer] :template If you have multiple templates, this is the index of the template to call
    # @option params ['text', 'unicode'] :type
    #
    # @param [Hash] params
    #
    # @return [Entity]
    #
    # @see https://developer.nexmo.com/api/sms/us-short-codes/alerts/sending
    #
    def send(params)
      request('/sc/us/alert/json', params: hyphenate(params), type: Post)
    end
  end
end
