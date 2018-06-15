require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteGroup < CanvasBaseMutation
        argument :group_id, ID, required: true
        field :group, LMSGraphQL::Types::Canvas::Group, null: false
        def resolve(group_id:)
          ctx[:canvas_api].proxy(
            "DELETE_GROUP",
            {
              "group_id": group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end