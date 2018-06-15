require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/external_feed"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteExternalFeedGroup < CanvasBaseMutation
        argument :group_id, ID, required: true
        argument :external_feed_id, ID, required: true
        field :external_feed, LMSGraphQL::Types::Canvas::CanvasExternalFeed, null: false
        def resolve(group_id:, external_feed_id:)
          ctx[:canvas_api].proxy(
            "DELETE_EXTERNAL_FEED_GROUPS",
            {
              "group_id": group_id,
              "external_feed_id": external_feed_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end