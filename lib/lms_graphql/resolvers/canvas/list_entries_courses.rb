require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListEntriesCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :ids, [String], required: false
        def resolve(course_id:, topic_id:, ids: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ENTRIES_COURSES").proxy(
            "LIST_ENTRIES_COURSES",
            {
              "course_id": course_id,
              "topic_id": topic_id,
              "ids": ids            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end