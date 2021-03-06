require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class RedirectToRootOutcomeGroupForContextGlobal < CanvasBaseResolver
        type Boolean, null: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("REDIRECT_TO_ROOT_OUTCOME_GROUP_FOR_CONTEXT_GLOBAL").proxy(
            "REDIRECT_TO_ROOT_OUTCOME_GROUP_FOR_CONTEXT_GLOBAL",
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