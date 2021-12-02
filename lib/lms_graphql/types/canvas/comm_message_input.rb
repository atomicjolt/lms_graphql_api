require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCommMessageInput < BaseInputObject
          class CommMessageInputWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "created"
          value "staged"
          value "sending"
          value "sent"
          value "bounced"
          value "dashboard"
          value "cancelled"
          value "closed"
        end
        description "CommMessages. API Docs: https://canvas.instructure.com/doc/api/comm_messages.html"
      argument :id, ID, "The ID of the CommMessage..Example: 42", required: false
      argument :created_at, LMSGraphQL::Types::DateTimeType, "The date and time this message was created.Example: 2013-03-19T21:00:00Z", required: false
      argument :sent_at, LMSGraphQL::Types::DateTimeType, "The date and time this message was sent.Example: 2013-03-20T22:42:00Z", required: false
      argument :workflow_state, CommMessageInputWorkflowStateEnum, "The workflow state of the message. One of 'created', 'staged', 'sending', 'sent', 'bounced', 'dashboard', 'cancelled', or 'closed'.Example: sent", required: false
      argument :from, String, "The address that was put in the 'from' field of the message.Example: notifications@example.com", required: false
      argument :from_name, String, "The display name for the from address.Example: Instructure Canvas", required: false
      argument :to, String, "The address the message was sent to:.Example: someone@example.com", required: false
      argument :reply_to, String, "The reply_to header of the message.Example: notifications+specialdata@example.com", required: false
      argument :subject, String, "The message subject.Example: example subject line", required: false
      argument :body, String, "The plain text body of the message.Example: This is the body of the message", required: false
      argument :html_body, String, "The HTML body of the message..Example: <html><body>This is the body of the message</body></html>", required: false

      end
    end
  end
end