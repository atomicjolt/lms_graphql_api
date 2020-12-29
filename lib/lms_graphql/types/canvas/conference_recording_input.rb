require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasConferenceRecordingInput < BaseInputObject
        description "Conferences. API Docs: https://canvas.instructure.com/doc/api/conferences.html"
      argument :duration_minutes, Int, "Example: 0", required: false
      argument :title, String, "Example: course2: Test conference 3 [170]_0", required: false
      argument :updated_at, LMSGraphQL::Types::DateTimeType, "Example: 2013-12-12T16:09:33.903-07:00", required: false
      argument :created_at, LMSGraphQL::Types::DateTimeType, "Example: 2013-12-12T16:09:09.960-07:00", required: false
      argument :playback_url, String, "Example: http://example.com/recording_url", required: false

      end
    end
  end
end