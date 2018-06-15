require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_membership"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleGroupMembershipUser < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasGroupMembership, null: false
        argument :group_id, ID, required: true
        argument :user_id, ID, required: true
        def resolve(group_id:, user_id:)
          context[:canvas_api].call("GET_SINGLE_GROUP_MEMBERSHIP_USERS").proxy(
            "GET_SINGLE_GROUP_MEMBERSHIP_USERS",
            {
              "group_id": group_id,
              "user_id": user_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end