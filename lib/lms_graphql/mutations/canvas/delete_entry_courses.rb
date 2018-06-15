require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteEntryCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(course_id:, topic_id:, id:)
          context[:canvas_api].call("DELETE_ENTRY_COURSES").proxy(
            "DELETE_ENTRY_COURSES",
            {
              "course_id": course_id,
              "topic_id": topic_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end