require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/group_membership"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateMembershipMembership < BaseMutation
        argument :group_id, ID, required: true
        argument :membership_id, ID, required: true
        argument :workflow_state, String, required: false
        argument :moderator, String, required: false
        field :group_membership, LMSGraphQL::Types::Canvas::CanvasGroupMembership, null: false
        def resolve(group_id:, membership_id:, workflow_state: nil, moderator: nil)
          context[:canvas_api].call("UPDATE_MEMBERSHIP_MEMBERSHIPS").proxy(
            "UPDATE_MEMBERSHIP_MEMBERSHIPS",
            {
              "group_id": group_id,
              "membership_id": membership_id
            },
            {
              "workflow_state": workflow_state,
              "moderator": moderator
            },
          ).parsed_response
        end
      end
    end
  end
end