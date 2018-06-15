require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleCourseAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::Course, null: false
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        argument :include, String, required: false
        def resolve(account_id:, id:, include: nil)
          context[:canvas_api].proxy(
            "GET_SINGLE_COURSE_ACCOUNTS",
            {
              "account_id": account_id,
              "id": id,
              "include": include            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end