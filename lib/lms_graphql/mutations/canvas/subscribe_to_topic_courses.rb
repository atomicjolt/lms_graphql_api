require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class SubscribeToTopicCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :topic_id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, topic_id:)
          context[:canvas_api].call("SUBSCRIBE_TO_TOPIC_COURSES").proxy(
            "SUBSCRIBE_TO_TOPIC_COURSES",
            {
              "course_id": course_id,
              "topic_id": topic_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end