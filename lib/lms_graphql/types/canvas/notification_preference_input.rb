require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasNotificationPreferenceInput < BaseInputObject
          class NotificationPreferenceInputFrequencyEnum < ::GraphQL::Schema::Enum
          value "immediately"
          value "daily"
          value "weekly"
          value "never"
        end
        description "Notification Preferences. API Docs: https://canvas.instructure.com/doc/api/notification_preferences.html"
        argument :href, String, "Example: https://canvas.instructure.com/users/1/communication_channels/email/student@example.edu/notification_preferences/new_announcement", required: false
        argument :notification, String, "The notification this preference belongs to.Example: new_announcement", required: false
        argument :category, String, "The category of that notification.Example: announcement", required: false
        argument :frequency, NotificationPreferenceInputFrequencyEnum, "How often to send notifications to this communication channel for the given notification. Possible values are 'immediately', 'daily', 'weekly', and 'never'.Example: daily", required: false

      end
    end
  end
end