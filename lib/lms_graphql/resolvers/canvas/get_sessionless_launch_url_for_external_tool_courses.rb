require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSessionlessLaunchUrlForExternalToolCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: false
        argument :url, String, required: false
        argument :assignment_id, ID, required: false
        argument :module_item_id, ID, required: false
        argument :launch_type, String, required: false
        def resolve(course_id:, id: nil, url: nil, assignment_id: nil, module_item_id: nil, launch_type: nil, get_all: false)
          result = context[:canvas_api].call("GET_SESSIONLESS_LAUNCH_URL_FOR_EXTERNAL_TOOL_COURSES").proxy(
            "GET_SESSIONLESS_LAUNCH_URL_FOR_EXTERNAL_TOOL_COURSES",
            {
              "course_id": course_id,
              "id": id,
              "url": url,
              "assignment_id": assignment_id,
              "module_item_id": module_item_id,
              "launch_type": launch_type            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end