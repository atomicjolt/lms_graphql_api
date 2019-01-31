require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz_report"
module LMSGraphQL
  module Resolvers
    module Canvas
      class RetrieveAllQuizReport < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasQuizReport], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :includes_all_versions, Boolean, required: false
        def resolve(course_id:, quiz_id:, includes_all_versions: nil, get_all: false)
          result = context[:canvas_api].call("RETRIEVE_ALL_QUIZ_REPORTS").proxy(
            "RETRIEVE_ALL_QUIZ_REPORTS",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "includes_all_versions": includes_all_versions            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end