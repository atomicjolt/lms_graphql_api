require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/submission"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetUsersMostRecentlyGradedSubmission < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasSubmission], null: false
        argument :get_all, Boolean, required: false
        argument :id, ID, required: true
        argument :include, [String], required: false
        argument :only_current_enrollments, Boolean, required: false
        argument :only_published_assignments, Boolean, required: false
        def resolve(id:, include: nil, only_current_enrollments: nil, only_published_assignments: nil, get_all: false)
          result = context[:canvas_api].call("GET_USERS_MOST_RECENTLY_GRADED_SUBMISSIONS").proxy(
            "GET_USERS_MOST_RECENTLY_GRADED_SUBMISSIONS",
            {
              "id": id,
              "include": include,
              "only_current_enrollments": only_current_enrollments,
              "only_published_assignments": only_published_assignments            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end