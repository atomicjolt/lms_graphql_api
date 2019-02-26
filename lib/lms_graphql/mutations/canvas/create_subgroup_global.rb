require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateSubgroupGlobal < BaseMutation
        argument :id, ID, required: true
        argument :title, String, required: true
        argument :description, String, required: false
        argument :vendor_guid, String, required: false
        field :outcome_group, LMSGraphQL::Types::Canvas::CanvasOutcomeGroup, null: false
        def resolve(id:, title:, description: nil, vendor_guid: nil)
          context[:canvas_api].call("CREATE_SUBGROUP_GLOBAL").proxy(
            "CREATE_SUBGROUP_GLOBAL",
            {
              "id": id
            },
            {
              "title": title,
              "description": description,
              "vendor_guid": vendor_guid
            },
          ).parsed_response
        end
      end
    end
  end
end