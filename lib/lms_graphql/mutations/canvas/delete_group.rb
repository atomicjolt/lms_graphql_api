require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteGroup < BaseMutation
        argument :group_id, ID, required: true
        
        
        field :group, LMSGraphQL::Types::Canvas::CanvasGroup, null: false
        
        def resolve(group_id:)
          context[:canvas_api].call("DELETE_GROUP").proxy(
            "DELETE_GROUP",
            {
              "group_id": group_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end