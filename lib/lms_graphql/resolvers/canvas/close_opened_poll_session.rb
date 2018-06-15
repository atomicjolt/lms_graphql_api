require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class CloseOpenedPollSession < CanvasBaseResolver
        type Boolean, null: false
        argument :poll_id, ID, required: true
        argument :id, ID, required: true
        def resolve(poll_id:, id:)
          context[:canvas_api].call("CLOSE_OPENED_POLL_SESSION").proxy(
            "CLOSE_OPENED_POLL_SESSION",
            {
              "poll_id": poll_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end