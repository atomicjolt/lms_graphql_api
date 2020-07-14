require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/line_item"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListLineItem < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasLineItem, null: false
        argument :course_id, ID, required: true
        argument :tag, String, required: false
        argument :resource_id, ID, required: false
        argument :resource_link_id, ID, required: false
        argument :limit, String, required: false
        def resolve(course_id:, tag: nil, resource_id: nil, resource_link_id: nil, limit: nil, get_all: false)
          result = context[:canvas_api].call("LIST_LINE_ITEMS").proxy(
            "LIST_LINE_ITEMS",
            {
              "course_id": course_id,
              "tag": tag,
              "resource_id": resource_id,
              "resource_link_id": resource_link_id,
              "limit": limit            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end