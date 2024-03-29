require_relative "../canvas_base_type"
require_relative "calendar_link"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasProfile < BaseType
          description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
        field :id, ID, "The ID of the user..Example: 1234", null: true
        field :name, String, "Sample User.Example: Sample User", null: true
        field :short_name, String, "Sample User.Example: Sample User", null: true
        field :sortable_name, String, "user, sample.Example: user, sample", null: true
        field :title, String, "", null: true
        field :bio, String, "", null: true
        field :primary_email, String, "sample_user@example.com.Example: sample_user@example.com", null: true
        field :login_id, ID, "sample_user@example.com.Example: sample_user@example.com", null: true
        field :sis_user_id, ID, "sis1.Example: sis1", null: true
        field :lti_user_id, ID, "", null: true
        field :avatar_url, String, "The avatar_url can change over time, so we recommend not caching it for more than a few hours.Example: url", null: true
        field :calendar, LMSGraphQL::Types::Canvas::CanvasCalendarLink, "", null: true
        field :time_zone, String, "Optional: This field is only returned in certain API calls, and will return the IANA time zone name of the user's preferred timezone..Example: America/Denver", null: true
        field :locale, String, "The users locale..", null: true
        field :k5_user, Boolean, "Optional: Whether or not the user is a K5 user. This field is nil if the user settings are not for the user making the request..Example: true", null: true

      end
    end
  end
end