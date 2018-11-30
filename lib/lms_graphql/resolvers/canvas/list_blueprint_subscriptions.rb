require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blueprint_subscription"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListBlueprintSubscription < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasBlueprintSubscription], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].call("LIST_BLUEPRINT_SUBSCRIPTIONS").proxy(
            "LIST_BLUEPRINT_SUBSCRIPTIONS",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end