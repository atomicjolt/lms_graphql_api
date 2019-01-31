require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowOutcomeGroupGlobal < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasOutcomeGroup, null: false
        argument :id, ID, required: true
        def resolve(id:, get_all: false)
          result = context[:canvas_api].call("SHOW_OUTCOME_GROUP_GLOBAL").proxy(
            "SHOW_OUTCOME_GROUP_GLOBAL",
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