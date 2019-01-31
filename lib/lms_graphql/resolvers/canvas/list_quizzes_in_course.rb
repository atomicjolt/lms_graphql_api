require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListQuizzesInCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasQuiz], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :search_term, String, required: false
        def resolve(course_id:, search_term: nil, get_all: false)
          result = context[:canvas_api].call("LIST_QUIZZES_IN_COURSE").proxy(
            "LIST_QUIZZES_IN_COURSE",
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