require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasMediaObject < BaseType
          description "Media Objects. API Docs: https://canvas.instructure.com/doc/api/media_objects.html"
        field :can_add_captions, Boolean, "", null: true
        field :user_entered_title, String, "", null: true
        field :title, String, "", null: true
        field :media_id, ID, "", null: true
        field :media_type, String, "", null: true
        field :media_tracks, String, "", null: true
        field :media_sources, String, "", null: true

      end
    end
  end
end