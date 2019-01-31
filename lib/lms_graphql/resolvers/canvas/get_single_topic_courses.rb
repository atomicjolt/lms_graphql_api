require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleTopicCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :include, String, required: false
        def resolve(course_id:, topic_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_TOPIC_COURSES").proxy(
            "GET_SINGLE_TOPIC_COURSES",
            {
              "course_id": course_id,
              "topic_id": topic_id,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end