require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class ReorderQuestionGroup < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        argument :order_id, Int, required: true
        argument :order_type, String, required: false
        field :return_value, Boolean, null: false
        def resolve(course_id:, quiz_id:, id:, order_id:, order_type: nil)
          context[:canvas_api].call("REORDER_QUESTION_GROUPS").proxy(
            "REORDER_QUESTION_GROUPS",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "id": id,
              "order[id]": order_id,
              "order[type]": order_type            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end