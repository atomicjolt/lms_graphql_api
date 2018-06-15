require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateOutcomeGroupGlobal < CanvasBaseMutation
        argument :id, ID, required: true
        argument :title, String, required: false
        argument :description, String, required: false
        argument :vendor_guid, String, required: false
        argument :parent_outcome_group_id, ID, required: false
        field :outcome_group, LMSGraphQL::Types::Canvas::CanvasOutcomeGroup, null: false
        def resolve(id:, title: nil, description: nil, vendor_guid: nil, parent_outcome_group_id: nil)
          context[:canvas_api].call("UPDATE_OUTCOME_GROUP_GLOBAL").proxy(
            "UPDATE_OUTCOME_GROUP_GLOBAL",
            {
              "id": id,
              "title": title,
              "description": description,
              "vendor_guid": vendor_guid,
              "parent_outcome_group_id": parent_outcome_group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end