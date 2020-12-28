require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteGroupCategory < BaseMutation
        argument :group_category_id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(group_category_id:)
          context[:canvas_api].call("DELETE_GROUP_CATEGORY").proxy(
            "DELETE_GROUP_CATEGORY",
            {
              "group_category_id": group_category_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end