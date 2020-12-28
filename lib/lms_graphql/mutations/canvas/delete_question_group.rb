require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteQuestionGroup < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, quiz_id:, id:)
          context[:canvas_api].call("DELETE_QUESTION_GROUP").proxy(
            "DELETE_QUESTION_GROUP",
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