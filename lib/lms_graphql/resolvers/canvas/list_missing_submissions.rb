require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMissingSubmission < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAssignment], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        argument :observed_user_id, ID, required: false
        argument :include, [String], required: false
        argument :filter, [String], required: false
        argument :course_ids, [ID], required: false
        def resolve(user_id:, observed_user_id: nil, include: nil, filter: nil, course_ids: nil, get_all: false)
          result = context[:canvas_api].call("LIST_MISSING_SUBMISSIONS").proxy(
            "LIST_MISSING_SUBMISSIONS",
            {
              "user_id": user_id,
              "observed_user_id": observed_user_id,
              "include": include,
              "filter": filter,
              "course_ids": course_ids            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end