require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/group_membership"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateMembership < BaseMutation
        argument :group_id, ID, required: true
        argument :user_id, ID, required: false
        
        
        field :group_membership, LMSGraphQL::Types::Canvas::CanvasGroupMembership, null: false
        
        def resolve(group_id:, user_id: nil)
          context[:canvas_api].call("CREATE_MEMBERSHIP").proxy(
            "CREATE_MEMBERSHIP",
            {
              "group_id": group_id
            },
            {
              "user_id": user_id
            },
          ).parsed_response
        end
      end
    end
  end
end