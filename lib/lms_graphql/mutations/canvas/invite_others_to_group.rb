require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class InviteOthersToGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :invitees, String, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(group_id:, invitees:)
          context[:canvas_api].call("INVITE_OTHERS_TO_GROUP").proxy(
            "INVITE_OTHERS_TO_GROUP",
            {
              "group_id": group_id
            },
            {
              "invitees": invitees
            },
          ).parsed_response
        end
      end
    end
  end
end