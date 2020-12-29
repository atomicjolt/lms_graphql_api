require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class LeaveGroupUser < BaseMutation
        argument :group_id, ID, required: true
        argument :user_id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(group_id:, user_id:)
          context[:canvas_api].call("LEAVE_GROUP_USERS").proxy(
            "LEAVE_GROUP_USERS",
            {
              "group_id": group_id,
              "user_id": user_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end