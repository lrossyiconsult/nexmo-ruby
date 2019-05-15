# frozen_string_literal: true

module Nexmo
  class Conversations < Namespace
    self.authentication = BearerToken

    self.request_body = JSON

    # Create a conversation
    #
    # @option params [String] :name Unique name for a conversation
    # @option params [String] :display_name The display name for the conversation
    # @option params [String] :image_url A link to an image for conversations' and users' avatars
    # @option params [Hash] :numbers An object containing number on different channels
    #   - *:sms* (String) phone number used for sms channel
    #   - *:pstn* (String) phone number used for pstn channel
    # @option params [Hash] :properties Conversation properties
    #   - *:ttl* (Integer) After how many seconds an empty conversation is deleted
    #
    # @return [Entity]
    #
    # @see https://developer.nexmo.com/api/conversation#createConversation
    #
    def create(params)
      request('/beta/conversations', params: params, type: Post)
    end

    # List all conversations associated with your application
    #
    # @option params [String] :date_start Return the records that occurred after this point in time
    # @option params [String] :date_end Return the records that occurred before this point in time
    # @option params [Integer] :page_size Return this amount of records in the response
    # @option params [Integer] :record_index Return calls from this index in the response
    # @option params ['asc', 'desc'] :order Return the records in ascending or descending order
    #
    # @param [Hash, nil] params
    #
    # @return [Entity]
    #
    # @see https://developer.nexmo.com/api/conversation#replaceConversation
    #
    def list(params = nil)
      request('/beta/conversations', params: params)
    end

    # Retrieve a conversation
    #
    # @param [String] id
    #
    # @return [Entity]
    #
    # @see https://developer.nexmo.com/api/conversation#retrieveConversation
    #
    def get(id)
      request('/beta/conversations/' + id)
    end
  
    # Update a conversation
    #
    # @option params [String] :name Unique name for a conversation
    # @option params [String] :display_name The display name for the conversation
    # @option params [String] :image_url A link to an image for conversations' and users' avatars
    # @option params [Hash] :numbers An object containing number on different channels
    #   - *:sms* (String) phone number used for sms channel
    #   - *:pstn* (String) phone number used for pstn channel
    # @option params [Hash] :properties Conversation properties
    #   - *:ttl* (Integer) After how many seconds an empty conversation is deleted
    #
    # @param [String] id
    # @param [Hash] params
    #
    # @return [Entity]
    #
    # @see https://developer.nexmo.com/api/conversation#replaceConversation
    #
    def update(id, params)
      request('/beta/conversations/' + id, params: params, type: Put)
    end

    # Delete a conversation
    #
    # @param [String] id
    #
    # @return [Entity]
    #
    # @see https://developer.nexmo.com/api/conversation#deleteConversation
    #
    def delete(id)
      request('/beta/conversations/' + id, type: Delete)
    end

    # @return [ConversationEvents]
    #
    def events
      @events ||= ConversationEvents.new(@client)
    end

    # @return [ConversationLegs]
    #
    def legs
      @legs ||= ConversationLegs.new(@client)
    end

    # @return [ConversationMembers]
    #
    def members
      @members ||= ConversationMembers.new(@client)
    end

    # @return [ConversationUsers]
    #
    def users
      @users ||= ConversationUsers.new(@client)
    end
  end
end
