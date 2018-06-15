require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/group_membership"
module LMSGraphQL
  module Mutations
    module Canvas
      class AssignUnassignedMember < CanvasBaseMutation
        argument :group_category_id, ID, required: true
        argument :sync, Boolean, required: false
        field :group_membership, LMSGraphQL::Types::Canvas::CanvasGroupMembership, null: false
        def resolve(group_category_id:, sync: nil)
          context[:canvas_api].call("ASSIGN_UNASSIGNED_MEMBERS").proxy(
            "ASSIGN_UNASSIGNED_MEMBERS",
            {
              "group_category_id": group_category_id,
              "sync": sync            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end