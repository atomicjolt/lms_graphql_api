require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteQuizQuestion < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(course_id:, quiz_id:, id:)
          context[:canvas_api].call("DELETE_QUIZ_QUESTION").proxy(
            "DELETE_QUIZ_QUESTION",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end