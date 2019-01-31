require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleCourseAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasCourse, null: false
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        argument :include, String, required: false
        argument :teacher_limit, Int, required: false
        def resolve(account_id:, id:, include: nil, teacher_limit: nil, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_COURSE_ACCOUNTS").proxy(
            "GET_SINGLE_COURSE_ACCOUNTS",
            {
              "account_id": account_id,
              "id": id,
              "include": include,
              "teacher_limit": teacher_limit            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end