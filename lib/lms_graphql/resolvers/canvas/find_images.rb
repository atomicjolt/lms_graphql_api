require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class FindImage < CanvasBaseResolver
        type Boolean, null: false
        argument :query, String, required: true
        def resolve(query:, get_all: false)
          result = context[:canvas_api].call("FIND_IMAGES").proxy(
            "FIND_IMAGES",
            {
              "query": query            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end