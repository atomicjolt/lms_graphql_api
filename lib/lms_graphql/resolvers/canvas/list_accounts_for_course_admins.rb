require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAccountsForCourseAdmin < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAccount], null: false
        argument :get_all, Boolean, required: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("LIST_ACCOUNTS_FOR_COURSE_ADMINS").proxy(
            "LIST_ACCOUNTS_FOR_COURSE_ADMINS",
            {
            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end