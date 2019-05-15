# frozen_string_literal: true

module Nexmo
  class Applications < Namespace
    self.request_body = JSON

    # Create a new application.
    #
    # @option params [required, String] :name The name of your application
    # @option params [required, 'voice', 'messages'] :type The Nexmo product or products that you access with this application
    # @option params [required, String] :answer_url The URL where your webhook delivers the Nexmo Call Control Object that governs this call
    # @option params [String] :answer_method The HTTP method used to make the request to answer_url
    # @option params [required, String] :event_url Nexmo sends event information asynchronously to this URL when status changes
    # @option params [String] :event_method The HTTP method used to send event information to event_url
    #
    # @param [Hash] params
    #
    # @return [Entity]
    #
    # @see https://developer.nexmo.com/api/application#create-an-application
    #
    def create(params)
      request('/v1/applications', params: params, type: Post)
    end

    # Retrieve details of all applications associated with your account.
    #
    # @option params [Integer] :page_size Set the number of items returned on each call to this endpoint
    # @option params [Integer] :page_index Set the offset from the first page
    #
    # @param [Hash, nil] params
    #
    # @return [Entity]
    #
    # @see https://developer.nexmo.com/api/application#retrieve-your-applications
    #
    def list(params = nil)
      request('/v1/applications', params: params)
    end

    # Retrieve details about a single application.
    #
    # @param [String] id
    #
    # @return [Entity]
    #
    # @see https://developer.nexmo.com/api/application#retrieve-an-application
    #
    def get(id)
      request('/v1/applications/' + id)
    end

    # Update an existing application.
    #
    # @option params [required, String] :name The name of your application
    # @option params [required, 'voice', 'messages'] :type The Nexmo product or products that you access with this application
    # @option params [required, String] :answer_url The URL where your webhook delivers the Nexmo Call Control Object that governs this call
    # @option params [String] :answer_method The HTTP method used to make the request to answer_url
    # @option params [required, String] :event_url Nexmo sends event information asynchronously to this URL when status changes
    # @option params [String] :event_method The HTTP method used to send event information to event_url
    #
    # @param [String] id
    # @param [Hash] params
    #
    # @return [Entity]
    #
    # @see https://developer.nexmo.com/api/application#update-an-application
    #
    def update(id, params)
      request('/v1/applications/' + id, params: params, type: Put)
    end

    # Delete a single application.
    #
    # @param [String] id
    #
    # @return [:no_content]
    #
    # @see https://developer.nexmo.com/api/application#destroy-an-application
    #
    def delete(id)
      request('/v1/applications/' + id, type: Delete)
    end
  end
end
