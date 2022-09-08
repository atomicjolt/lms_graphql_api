require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/line_item"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowLineItem < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasLineItem, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :include, [String], required: false
        def resolve(course_id:, id:, include: nil, get_all: false)
          result = context[:canvas_api].call("SHOW_LINE_ITEM").proxy(
            "SHOW_LINE_ITEM",
            {
              "course_id": course_id,
              "id": id,
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