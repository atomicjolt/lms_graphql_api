require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAccountsForCourseAdmin < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::Account], null: false

        def resolve()
          context[:canvas_api].proxy(
            "LIST_ACCOUNTS_FOR_COURSE_ADMINS",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end