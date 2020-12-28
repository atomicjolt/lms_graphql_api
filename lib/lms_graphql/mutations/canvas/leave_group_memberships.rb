require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class LeaveGroupMembership < BaseMutation
        argument :group_id, ID, required: true
        argument :membership_id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(group_id:, membership_id:)
          context[:canvas_api].call("LEAVE_GROUP_MEMBERSHIPS").proxy(
            "LEAVE_GROUP_MEMBERSHIPS",
            {
              "group_id": group_id,
              "membership_id": membership_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end