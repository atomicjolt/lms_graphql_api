require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteEntryGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(group_id:, topic_id:, id:)
          context[:canvas_api].call("DELETE_ENTRY_GROUPS").proxy(
            "DELETE_ENTRY_GROUPS",
            {
              "group_id": group_id,
              "topic_id": topic_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end