require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateSubgroupAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        argument :title, String, required: true
        argument :description, String, required: false
        argument :vendor_guid, String, required: false
        
        
        field :outcome_group, LMSGraphQL::Types::Canvas::CanvasOutcomeGroup, null: false
        
        def resolve(account_id:, id:, title:, description: nil, vendor_guid: nil)
          context[:canvas_api].call("CREATE_SUBGROUP_ACCOUNTS").proxy(
            "CREATE_SUBGROUP_ACCOUNTS",
            {
              "account_id": account_id,
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