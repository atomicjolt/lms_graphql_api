require_relative "../canvas_base_type"
require_relative "conference_recording"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasConference < BaseType
        description "Conferences. API Docs: https://canvas.instructure.com/doc/api/conferences.html"
      	field :id, ID, "The id of the conference.Example: 170", null: true
      	field :conference_type, String, "The type of conference.Example: AdobeConnect", null: true
      	field :conference_key, String, "The 3rd party's ID for the conference.Example: abcdjoelisgreatxyz", null: true
      	field :description, String, "The description for the conference.Example: Conference Description", null: true
      	field :duration, Int, "The expected duration the conference is supposed to last.Example: 60", null: true
      	field :ended_at, LMSGraphQL::Types::DateTimeType, "The date that the conference ended at, null if it hasn't ended.Example: 2013-12-13T17:23:26Z", null: true
      	field :started_at, LMSGraphQL::Types::DateTimeType, "The date the conference started at, null if it hasn't started.Example: 2013-12-12T23:02:17Z", null: true
      	field :title, String, "The title of the conference.Example: Test conference", null: true
      	field :users, Int, "Array of user ids that are participants in the conference.Example: 1, 7, 8, 9, 10", null: true
      	field :has_advanced_settings, Boolean, "True if the conference type has advanced settings..", null: true
      	field :long_running, Boolean, "If true the conference is long running and has no expected end time.", null: true
      	field :user_settings, String, "A collection of settings specific to the conference type.Example: true", null: true
      	field :recordings, [LMSGraphQL::Types::Canvas::CanvasConferenceRecording], "A List of recordings for the conference.", null: true
      	field :url, String, "URL for the conference, may be null if the conference type doesn't set it.", null: true
      	field :join_url, String, "URL to join the conference, may be null if the conference type doesn't set it.", null: true
      	field :context_type, String, "The type of this conference's context, typically 'Course' or 'Group'..", null: true
      	field :context_id, ID, "The ID of this conference's context..", null: true

      end
    end
  end
end