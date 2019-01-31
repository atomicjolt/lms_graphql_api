require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_membership"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupMembership < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroupMembership], null: false
        argument :get_all, Boolean, required: false
        argument :group_id, ID, required: true
        argument :filter_states, String, required: false
        def resolve(group_id:, filter_states: nil, get_all: false)
          result = context[:canvas_api].call("LIST_GROUP_MEMBERSHIPS").proxy(
            "LIST_GROUP_MEMBERSHIPS",
            {
              "group_id": group_id,
              "filter_states": filter_states            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end