require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz_question"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleQuizQuestion < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasQuizQuestion, null: false
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, quiz_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_QUIZ_QUESTION").proxy(
            "GET_SINGLE_QUIZ_QUESTION",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end