require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/conference"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListConferencesGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasConference], null: false
        argument :group_id, ID, required: true
        def resolve(group_id:)
          context[:canvas_api].proxy(
            "LIST_CONFERENCES_GROUPS",
            {
              "group_id": group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end