require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteOutcomeGroupGlobal < BaseMutation
        argument :id, ID, required: true
        field :outcome_group, LMSGraphQL::Types::Canvas::CanvasOutcomeGroup, null: false
        def resolve(id:)
          context[:canvas_api].call("DELETE_OUTCOME_GROUP_GLOBAL").proxy(
            "DELETE_OUTCOME_GROUP_GLOBAL",
            {
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end