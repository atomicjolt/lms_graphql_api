require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_link"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListLinkedOutcomesGlobal < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasOutcomeLink], null: false
        argument :id, ID, required: true
        argument :outcome_style, String, required: false
        def resolve(id:, outcome_style: nil)
          context[:canvas_api].call("LIST_LINKED_OUTCOMES_GLOBAL").proxy(
            "LIST_LINKED_OUTCOMES_GLOBAL",
            {
              "id": id,
              "outcome_style": outcome_style            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end