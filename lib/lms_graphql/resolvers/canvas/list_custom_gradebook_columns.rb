require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/custom_column"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListCustomGradebookColumn < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCustomColumn], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :include_hidden, Boolean, required: false
        def resolve(course_id:, include_hidden: nil, get_all: false)
          result = context[:canvas_api].call("LIST_CUSTOM_GRADEBOOK_COLUMNS").proxy(
            "LIST_CUSTOM_GRADEBOOK_COLUMNS",
            {
              "course_id": course_id,
              "include_hidden": include_hidden            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end