require_relative "../canvas_base_input_type"
require_relative "conference_recording"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasConferenceInput < BaseInputObject
        description "Conferences. API Docs: https://canvas.instructure.com/doc/api/conferences.html"
      argument :id, ID, "The id of the conference.Example: 170", required: false
      argument :conference_type, String, "The type of conference.Example: AdobeConnect", required: false
      argument :conference_key, String, "The 3rd party's ID for the conference.Example: abcdjoelisgreatxyz", required: false
      argument :description, String, "The description for the conference.Example: Conference Description", required: false
      argument :duration, Int, "The expected duration the conference is supposed to last.Example: 60", required: false
      argument :ended_at, LMSGraphQL::Types::DateTimeType, "The date that the conference ended at, null if it hasn't ended.Example: 2013-12-13T17:23:26Z", required: false
      argument :started_at, LMSGraphQL::Types::DateTimeType, "The date the conference started at, null if it hasn't started.Example: 2013-12-12T23:02:17Z", required: false
      argument :title, String, "The title of the conference.Example: Test conference", required: false
      argument :users, Int, "Array of user ids that are participants in the conference.Example: 1, 7, 8, 9, 10", required: false
      argument :has_advanced_settings, Boolean, "True if the conference type has advanced settings..", required: false
      argument :long_running, Boolean, "If true the conference is long running and has no expected end time.", required: false
      argument :user_settings, String, "A collection of settings specific to the conference type.Example: true", required: false
      argument :recordings, [LMSGraphQL::Types::Canvas::CanvasConferenceRecordingInput], "A List of recordings for the conference.", required: false
      argument :url, String, "URL for the conference, may be null if the conference type doesn't set it.", required: false
      argument :join_url, String, "URL to join the conference, may be null if the conference type doesn't set it.", required: false
      argument :context_type, String, "The type of this conference's context, typically 'Course' or 'Group'..", required: false
      argument :context_id, ID, "The ID of this conference's context..", required: false

      end
    end
  end
end