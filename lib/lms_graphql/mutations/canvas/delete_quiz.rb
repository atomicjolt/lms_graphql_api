require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/quiz"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteQuiz < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        field :quiz, LMSGraphQL::Types::Canvas::CanvasQuiz, null: false
        def resolve(course_id:, id:)
          context[:canvas_api].call("DELETE_QUIZ").proxy(
            "DELETE_QUIZ",
            {
              "course_id": course_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end