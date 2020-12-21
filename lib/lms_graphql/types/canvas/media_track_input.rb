require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasMediaTrackInput < BaseInputObject
        description "Media Objects. API Docs: https://canvas.instructure.com/doc/api/media_objects.html"
      	argument :id, ID, "", required: false
      	argument :user_id, ID, "", required: false
      	argument :media_object_id, ID, "", required: false
      	argument :kind, String, "", required: false
      	argument :locale, String, "", required: false
      	argument :content, String, "", required: false
      	argument :created_at, String, "", required: false
      	argument :updated_at, String, "", required: false
      	argument :webvtt_content, String, "", required: false

      end
    end
  end
end