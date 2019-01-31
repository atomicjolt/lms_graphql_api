require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetBrandConfigVariablesThatShouldBeUsedForThisDomain < CanvasBaseResolver
        type Boolean, null: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("GET_BRAND_CONFIG_VARIABLES_THAT_SHOULD_BE_USED_FOR_THIS_DOMAIN").proxy(
            "GET_BRAND_CONFIG_VARIABLES_THAT_SHOULD_BE_USED_FOR_THIS_DOMAIN",
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