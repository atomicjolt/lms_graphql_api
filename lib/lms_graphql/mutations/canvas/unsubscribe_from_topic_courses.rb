require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UnsubscribeFromTopicCourse < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :topic_id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(course_id:, topic_id:)
          ctx[:canvas_api].proxy(
            "UNSUBSCRIBE_FROM_TOPIC_COURSES",
            {
              "course_id": course_id,
              "topic_id": topic_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end