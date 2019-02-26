require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/quiz"
module LMSGraphQL
  module Mutations
    module Canvas
      class EditQuiz < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :quiz_notify_of_update, Boolean, required: false
        field :quiz, LMSGraphQL::Types::Canvas::CanvasQuiz, null: false
        def resolve(course_id:, id:, quiz_notify_of_update: nil)
          context[:canvas_api].call("EDIT_QUIZ").proxy(
            "EDIT_QUIZ",
            {
              "course_id": course_id,
              "id": id
            },
            {
              "quiz[notify_of_update]": quiz_notify_of_update
            },
          ).parsed_response
        end
      end
    end
  end
end