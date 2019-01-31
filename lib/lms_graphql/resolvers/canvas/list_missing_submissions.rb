require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMissingSubmission < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAssignment], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        argument :include, String, required: false
        argument :filter, String, required: false
        def resolve(user_id:, include: nil, filter: nil, get_all: false)
          result = context[:canvas_api].call("LIST_MISSING_SUBMISSIONS").proxy(
            "LIST_MISSING_SUBMISSIONS",
            {
              "user_id": user_id,
              "include": include,
              "filter": filter            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end