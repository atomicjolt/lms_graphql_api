require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/result"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowCollectionOfResult < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasResult, null: false
        argument :course_id, ID, required: true
        argument :line_item_id, ID, required: true
        def resolve(course_id:, line_item_id:, get_all: false)
          result = context[:canvas_api].call("SHOW_COLLECTION_OF_RESULTS").proxy(
            "SHOW_COLLECTION_OF_RESULTS",
            {
              "course_id": course_id,
              "line_item_id": line_item_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end