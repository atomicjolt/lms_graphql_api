require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetVisibleCourseNavigationTool < CanvasBaseResolver
        type Boolean, null: false
        argument :context_codes, [String], required: true
        def resolve(context_codes:, get_all: false)
          result = context[:canvas_api].call("GET_VISIBLE_COURSE_NAVIGATION_TOOLS").proxy(
            "GET_VISIBLE_COURSE_NAVIGATION_TOOLS",
            {
              "context_codes": context_codes            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end