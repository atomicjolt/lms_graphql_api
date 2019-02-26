require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class QuizSubmissionFilesUploadFile < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :name, String, required: false
        argument :on_duplicate, String, required: false
        field :return_value, Boolean, null: false
        def resolve(course_id:, quiz_id:, name: nil, on_duplicate: nil)
          context[:canvas_api].call("QUIZ_SUBMISSION_FILES_UPLOAD_FILE").proxy(
            "QUIZ_SUBMISSION_FILES_UPLOAD_FILE",
            {
              "course_id": course_id,
              "quiz_id": quiz_id
            },
            {
              "name": name,
              "on_duplicate": on_duplicate
            },
          ).parsed_response
        end
      end
    end
  end
end