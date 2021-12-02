require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetManuallyCreatedCoursesSubAccountForDomainRootAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasAccount, null: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("GET_MANUALLY_CREATED_COURSES_SUB_ACCOUNT_FOR_DOMAIN_ROOT_ACCOUNT").proxy(
            "GET_MANUALLY_CREATED_COURSES_SUB_ACCOUNT_FOR_DOMAIN_ROOT_ACCOUNT",
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