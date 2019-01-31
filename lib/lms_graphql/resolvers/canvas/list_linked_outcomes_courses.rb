require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_link"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListLinkedOutcomesCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasOutcomeLink], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :outcome_style, String, required: false
        def resolve(course_id:, id:, outcome_style: nil, get_all: false)
          result = context[:canvas_api].call("LIST_LINKED_OUTCOMES_COURSES").proxy(
            "LIST_LINKED_OUTCOMES_COURSES",
            {
              "course_id": course_id,
              "id": id,
              "outcome_style": outcome_style            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end