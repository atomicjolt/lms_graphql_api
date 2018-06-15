require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CoursesUploadFile < BaseMutation
        argument :course_id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(course_id:)
          context[:canvas_api].call("COURSES_UPLOAD_FILE").proxy(
            "COURSES_UPLOAD_FILE",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end