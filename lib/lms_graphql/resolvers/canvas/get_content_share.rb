require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_share"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetContentShare < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasContentShare, null: false
        argument :user_id, ID, required: true
        argument :id, ID, required: true
        def resolve(user_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_CONTENT_SHARE").proxy(
            "GET_CONTENT_SHARE",
            {
              "user_id": user_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end