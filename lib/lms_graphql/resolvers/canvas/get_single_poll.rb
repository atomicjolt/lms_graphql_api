require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSinglePoll < CanvasBaseResolver
        type Boolean, null: false
        argument :id, ID, required: true
        def resolve(id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_POLL").proxy(
            "GET_SINGLE_POLL",
            {
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end