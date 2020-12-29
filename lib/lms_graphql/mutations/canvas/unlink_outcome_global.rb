require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_link"
module LMSGraphQL
  module Mutations
    module Canvas
      class UnlinkOutcomeGlobal < BaseMutation
        argument :id, ID, required: true
        argument :outcome_id, ID, required: true
        
        
        field :outcome_link, LMSGraphQL::Types::Canvas::CanvasOutcomeLink, null: false
        
        def resolve(id:, outcome_id:)
          context[:canvas_api].call("UNLINK_OUTCOME_GLOBAL").proxy(
            "UNLINK_OUTCOME_GLOBAL",
            {
              "id": id,
              "outcome_id": outcome_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end