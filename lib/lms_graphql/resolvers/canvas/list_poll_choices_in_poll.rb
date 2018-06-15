require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListPollChoicesInPoll < CanvasBaseResolver
        type Boolean, null: false
        argument :poll_id, ID, required: true
        def resolve(poll_id:)
          context[:canvas_api].call("LIST_POLL_CHOICES_IN_POLL").proxy(
            "LIST_POLL_CHOICES_IN_POLL",
            {
              "poll_id": poll_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end