require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/discussion_topic"
module LMSGraphQL
  module Mutations
    module Canvas
      class DuplicateDiscussionTopicCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :topic_id, ID, required: true
        
        
        field :discussion_topic, LMSGraphQL::Types::Canvas::CanvasDiscussionTopic, null: false
        
        def resolve(course_id:, topic_id:)
          context[:canvas_api].call("DUPLICATE_DISCUSSION_TOPIC_COURSES").proxy(
            "DUPLICATE_DISCUSSION_TOPIC_COURSES",
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