require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasMediaObjectInput < BaseInputObject
        description "Media Objects. API Docs: https://canvas.instructure.com/doc/api/media_objects.html"
      argument :can_add_captions, Boolean, "", required: false
      argument :user_entered_title, String, "", required: false
      argument :title, String, "", required: false
      argument :media_id, ID, "", required: false
      argument :media_type, String, "", required: false
      argument :media_tracks, String, "", required: false
      argument :media_sources, String, "", required: false

      end
    end
  end
end