require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class ReorderPinnedTopicsCourse < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :order, Int, required: true
        field :return_value, Boolean, null: false
        def resolve(course_id:, order:)
          context[:canvas_api].call("REORDER_PINNED_TOPICS_COURSES").proxy(
            "REORDER_PINNED_TOPICS_COURSES",
            {
              "course_id": course_id,
              "order": order            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end