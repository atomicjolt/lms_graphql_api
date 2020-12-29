require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class GroupsUploadFile < BaseMutation
        argument :group_id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(group_id:)
          context[:canvas_api].call("GROUPS_UPLOAD_FILE").proxy(
            "GROUPS_UPLOAD_FILE",
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