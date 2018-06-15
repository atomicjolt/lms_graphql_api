require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/role"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateRole < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        argument :label, String, required: false
        argument :permissions__X__explicit, Boolean, required: false
        argument :permissions__X__enabled, Boolean, required: false
        argument :permissions__X__applies_to_self, Boolean, required: false
        argument :permissions__X__applies_to_descendants, Boolean, required: false
        field :role, LMSGraphQL::Types::Canvas::CanvasRole, null: false
        def resolve(account_id:, id:, label: nil, permissions__X__explicit: nil, permissions__X__enabled: nil, permissions__X__applies_to_self: nil, permissions__X__applies_to_descendants: nil)
          context[:canvas_api].call("UPDATE_ROLE").proxy(
            "UPDATE_ROLE",
            {
              "account_id": account_id,
              "id": id,
              "label": label,
              "permissions[<X>][explicit]": permissions__X__explicit,
              "permissions[<X>][enabled]": permissions__X__enabled,
              "permissions[<X>][applies_to_self]": permissions__X__applies_to_self,
              "permissions[<X>][applies_to_descendants]": permissions__X__applies_to_descendants            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end