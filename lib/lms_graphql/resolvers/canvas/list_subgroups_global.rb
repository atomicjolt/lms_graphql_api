require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListSubgroupsGlobal < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::OutcomeGroup], null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].proxy(
            "LIST_SUBGROUPS_GLOBAL",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end