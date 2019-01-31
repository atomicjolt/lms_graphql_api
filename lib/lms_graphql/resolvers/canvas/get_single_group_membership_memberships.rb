require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_membership"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleGroupMembershipMembership < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasGroupMembership, null: false
        argument :group_id, ID, required: true
        argument :membership_id, ID, required: true
        def resolve(group_id:, membership_id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_GROUP_MEMBERSHIP_MEMBERSHIPS").proxy(
            "GET_SINGLE_GROUP_MEMBERSHIP_MEMBERSHIPS",
            {
              "group_id": group_id,
              "membership_id": membership_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end