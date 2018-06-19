require_relative "../canvas_base_input_type"
require_relative "conversation_participant_input"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasConversationInput < BaseInputObject
        description "Conversations. API Docs: https://canvas.instructure.com/doc/api/conversations.html"
        argument :id, ID, "the unique identifier for the conversation..Example: 2", required: false
        argument :subject, String, "the subject of the conversation..Example: 2", required: false
        argument :workflow_state, String, "The current state of the conversation (read, unread or archived)..Example: unread", required: false
        argument :last_message, String, "A <=100 character preview from the most recent message..Example: sure thing, here's the file", required: false
        argument :start_at, LMSGraphQL::Types::DateTimeType, "the date and time at which the last message was sent..Example: 2011-09-02T12:00:00Z", required: false
        argument :message_count, Int, "the number of messages in the conversation..Example: 2", required: false
        argument :subscribed, Boolean, "whether the current user is subscribed to the conversation..Example: true", required: false
        argument :private, Boolean, "whether the conversation is private..Example: true", required: false
        argument :starred, Boolean, "whether the conversation is starred..Example: true", required: false
        argument :properties, String, "Additional conversation flags (last_author, attachments, media_objects). Each listed property means the flag is set to true (i.e. the current user is the most recent author, there are attachments, or there are media objects).", required: false
        argument :audience, Int, "Array of user ids who are involved in the conversation, ordered by participation level, then alphabetical. Excludes current user, unless this is a monologue..", required: false
        argument :audience_contexts, String, "Most relevant shared contexts (courses and groups) between current user and other participants. If there is only one participant, it will also include that user's enrollment(s)/ membership type(s) in each course/group..", required: false
        argument :avatar_url, String, "URL to appropriate icon for this conversation (custom, individual or group avatar, depending on audience)..Example: https://canvas.instructure.com/images/messages/avatar-group-50.png", required: false
        argument :participants, [LMSGraphQL::Types::Canvas::CanvasConversationParticipantInput], "Array of users participating in the conversation. Includes current user..", required: false
        argument :visible, Boolean, "indicates whether the conversation is visible under the current scope and filter. This attribute is always true in the index API response, and is primarily useful in create/update responses so that you can know if the record should be displayed in the UI. The default scope is assumed, unless a scope or filter is passed to the create/update API call..Example: true", required: false
        argument :context_name, String, "Name of the course or group in which the conversation is occurring..Example: Canvas 101", required: false

      end
    end
  end
end