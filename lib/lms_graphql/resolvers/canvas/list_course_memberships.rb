require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/names_and_role_membership"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListCourseMembership < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasNamesAndRoleMembership, null: false
        argument :course_id, ID, required: true
        argument :rlid, String, required: false
        argument :role, String, required: false
        argument :limit, String, required: false
        def resolve(course_id:, rlid: nil, role: nil, limit: nil, get_all: false)
          result = context[:canvas_api].call("LIST_COURSE_MEMBERSHIPS").proxy(
            "LIST_COURSE_MEMBERSHIPS",
            {
              "course_id": course_id,
              "rlid": rlid,
              "role": role,
              "limit": limit            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end