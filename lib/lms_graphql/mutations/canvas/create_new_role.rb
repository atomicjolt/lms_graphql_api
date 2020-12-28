require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/role"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateNewRole < BaseMutation
        argument :account_id, ID, required: true
        argument :label, String, required: true
        argument :role, String, required: false
        argument :base_role_type, String, required: false
        argument :permissions__X__explicit, Boolean, required: false
        argument :permissions__X__enabled, Boolean, required: false
        argument :permissions__X__locked, Boolean, required: false
        argument :permissions__X__applies_to_self, Boolean, required: false
        argument :permissions__X__applies_to_descendants, Boolean, required: false
        
        
        field :role, LMSGraphQL::Types::Canvas::CanvasRole, null: false
        
        def resolve(account_id:, label:, role: nil, base_role_type: nil, permissions__X__explicit: nil, permissions__X__enabled: nil, permissions__X__locked: nil, permissions__X__applies_to_self: nil, permissions__X__applies_to_descendants: nil)
          context[:canvas_api].call("CREATE_NEW_ROLE").proxy(
            "CREATE_NEW_ROLE",
            {
              "account_id": account_id
            },
            {
              "label": label,
              "role": role,
              "base_role_type": base_role_type,
              "permissions[<X>][explicit]": permissions__X__explicit,
              "permissions[<X>][enabled]": permissions__X__enabled,
              "permissions[<X>][locked]": permissions__X__locked,
              "permissions[<X>][applies_to_self]": permissions__X__applies_to_self,
              "permissions[<X>][applies_to_descendants]": permissions__X__applies_to_descendants
            },
          ).parsed_response
        end
      end
    end
  end
end