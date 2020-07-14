require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/media_trackk"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateMediaTrack < BaseMutation
        argument :media_object_id, ID, required: true
        argument :include, String, required: false
        field :media_trackk, [LMSGraphQL::Types::Canvas::CanvasMediaTrackk], null: false
        def resolve(media_object_id:, include: nil)
          context[:canvas_api].call("UPDATE_MEDIA_TRACKS").proxy(
            "UPDATE_MEDIA_TRACKS",
            {
              "media_object_id": media_object_id
            },
            {
              "include": include
            },
          ).parsed_response
        end
      end
    end
  end
end