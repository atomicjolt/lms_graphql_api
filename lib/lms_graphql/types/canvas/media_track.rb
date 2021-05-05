require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasMediaTrack < BaseType
          description "Media Objects. API Docs: https://canvas.instructure.com/doc/api/media_objects.html"
        field :id, ID, "", null: true
        field :user_id, ID, "", null: true
        field :media_object_id, ID, "", null: true
        field :kind, String, "", null: true
        field :locale, String, "", null: true
        field :content, String, "", null: true
        field :created_at, String, "", null: true
        field :updated_at, String, "", null: true
        field :webvtt_content, String, "", null: true

      end
    end
  end
end