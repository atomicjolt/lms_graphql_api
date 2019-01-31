require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSinglePollChoice < CanvasBaseResolver
        type Boolean, null: false
        argument :poll_id, ID, required: true
        argument :id, ID, required: true
        def resolve(poll_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_POLL_CHOICE").proxy(
            "GET_SINGLE_POLL_CHOICE",
            {
              "poll_id": poll_id,
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