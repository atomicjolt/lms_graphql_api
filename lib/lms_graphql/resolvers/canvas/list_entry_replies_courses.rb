require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListEntryRepliesCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :entry_id, ID, required: true
        def resolve(course_id:, topic_id:, entry_id:, get_all: false)
          result = context[:canvas_api].call("LIST_ENTRY_REPLIES_COURSES").proxy(
            "LIST_ENTRY_REPLIES_COURSES",
            {
              "course_id": course_id,
              "topic_id": topic_id,
              "entry_id": entry_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end