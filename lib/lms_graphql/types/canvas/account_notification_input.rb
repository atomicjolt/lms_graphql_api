require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAccountNotificationInput < BaseInputObject
          class AccountNotificationInputIconEnum < ::GraphQL::Schema::Enum
          value "warning"
          value "information"
          value "question"
          value "error"
          value "calendar"
        end
        description "Account Notifications. API Docs: https://canvas.instructure.com/doc/api/account_notifications.html"
        argument :subject, String, "The subject of the notifications.Example: Attention Students", required: false
        argument :message, String, "The message to be sent in the notification..Example: This is a test of the notification system.", required: false
        argument :start_at, GraphQL::Types::ISO8601DateTime, "When to send out the notification..Example: 2013-08-28T23:59:00-06:00", required: false
        argument :end_at, GraphQL::Types::ISO8601DateTime, "When to expire the notification..Example: 2013-08-29T23:59:00-06:00", required: false
        argument :icon, AccountNotificationInputIconEnum, "The icon to display with the message.  Defaults to warning..Example: information", required: false
        argument :roles, [String], "(Deprecated) The roles to send the notification to.  If roles is not passed it defaults to all roles.Example: StudentEnrollment", required: false
        argument :role_ids, [ID], "The roles to send the notification to.  If roles is not passed it defaults to all roles.Example: 1", required: false

      end
    end
  end
end