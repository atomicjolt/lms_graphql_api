require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_link"
module LMSGraphQL
  module Mutations
    module Canvas
      class UnlinkOutcomeGlobal < CanvasBaseMutation
        argument :id, ID, required: true
        argument :outcome_id, ID, required: true
        field :outcome_link, LMSGraphQL::Types::Canvas::CanvasOutcomeLink, null: false
        def resolve(id:, outcome_id:)
          ctx[:canvas_api].proxy(
            "UNLINK_OUTCOME_GLOBAL",
            {
              "id": id,
              "outcome_id": outcome_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end