require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class ReorderPinnedTopicsGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :order, Int, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(group_id:, order:)
          context[:canvas_api].call("REORDER_PINNED_TOPICS_GROUPS").proxy(
            "REORDER_PINNED_TOPICS_GROUPS",
            {
              "group_id": group_id
            },
            {
              "order": order
            },
          ).parsed_response
        end
      end
    end
  end
end