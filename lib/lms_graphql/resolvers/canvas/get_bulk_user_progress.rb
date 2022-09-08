require_relative "../canvas_base_resolver"
require_relative "../../types/canvas_bespoke/canvas_module_user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetBulkUserProgress < CanvasBaseResolver
        type LMSGraphQL::Types::CanvasBespoke::CanvasModuleUser, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("GET_BULK_USER_PROGRESS").proxy(
            "GET_BULK_USER_PROGRESS",
            {
              "course_id": course_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end