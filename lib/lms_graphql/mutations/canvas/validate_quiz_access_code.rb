require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class ValidateQuizAccessCode < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :access_code, String, required: true
        field :return_value, Boolean, null: false
        def resolve(course_id:, id:, access_code:)
          context[:canvas_api].call("VALIDATE_QUIZ_ACCESS_CODE").proxy(
            "VALIDATE_QUIZ_ACCESS_CODE",
            {
              "course_id": course_id,
              "id": id,
              "access_code": access_code            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end