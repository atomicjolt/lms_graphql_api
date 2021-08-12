require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/media_track"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMediaTracksForMediaObject < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasMediaTrack], null: false
        argument :get_all, Boolean, required: false
        argument :media_object_id, ID, required: true
        argument :include, [String], required: false
        def resolve(media_object_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_MEDIA_TRACKS_FOR_MEDIA_OBJECT").proxy(
            "LIST_MEDIA_TRACKS_FOR_MEDIA_OBJECT",
            {
              "media_object_id": media_object_id,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end