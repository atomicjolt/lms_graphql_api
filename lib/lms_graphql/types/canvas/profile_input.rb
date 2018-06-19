require_relative "../canvas_base_input_type"
require_relative "calendar_link_input"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasProfileInput < BaseInputObject
        description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
        argument :id, ID, "The ID of the user..Example: 1234", required: false
        argument :name, String, "Sample User.Example: Sample User", required: false
        argument :short_name, String, "Sample User.Example: Sample User", required: false
        argument :sortable_name, String, "user, sample.Example: user, sample", required: false
        argument :title, String, "", required: false
        argument :bio, String, "", required: false
        argument :primary_email, String, "sample_user@example.com.Example: sample_user@example.com", required: false
        argument :login_id, ID, "sample_user@example.com.Example: sample_user@example.com", required: false
        argument :sis_user_id, ID, "sis1.Example: sis1", required: false
        argument :lti_user_id, ID, "", required: false
        argument :avatar_url, String, "The avatar_url can change over time, so we recommend not caching it for more than a few hours.Example: url", required: false
        argument :calendar, LMSGraphQL::Types::Canvas::CanvasCalendarLinkInput, "", required: false
        argument :time_zone, String, "Optional: This field is only returned in certain API calls, and will return the IANA time zone name of the user's preferred timezone..Example: America/Denver", required: false
        argument :locale, String, "The users locale..", required: false

      end
    end
  end
end