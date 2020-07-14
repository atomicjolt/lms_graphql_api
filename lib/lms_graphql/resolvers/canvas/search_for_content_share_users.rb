require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class SearchForContentShareUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasUser], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :search_term, String, required: true
        def resolve(course_id:, search_term:, get_all: false)
          result = context[:canvas_api].call("SEARCH_FOR_CONTENT_SHARE_USERS").proxy(
            "SEARCH_FOR_CONTENT_SHARE_USERS",
            {
              "course_id": course_id,
              "search_term": search_term            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end