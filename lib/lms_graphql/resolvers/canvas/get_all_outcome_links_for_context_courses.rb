require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_link"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAllOutcomeLinksForContextCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasOutcomeLink], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :outcome_style, String, required: false
        argument :outcome_group_style, String, required: false
        def resolve(course_id:, outcome_style: nil, outcome_group_style: nil, get_all: false)
          result = context[:canvas_api].call("GET_ALL_OUTCOME_LINKS_FOR_CONTEXT_COURSES").proxy(
            "GET_ALL_OUTCOME_LINKS_FOR_CONTEXT_COURSES",
            {
              "course_id": course_id,
              "outcome_style": outcome_style,
              "outcome_group_style": outcome_group_style            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end