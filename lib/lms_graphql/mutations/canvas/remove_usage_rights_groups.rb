require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveUsageRightsGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :file_ids, [ID], required: true
        argument :folder_ids, [ID], required: false
        field :return_value, Boolean, null: false
        def resolve(group_id:, file_ids:, folder_ids: nil)
          context[:canvas_api].call("REMOVE_USAGE_RIGHTS_GROUPS").proxy(
            "REMOVE_USAGE_RIGHTS_GROUPS",
            {
              "group_id": group_id,
              "file_ids": file_ids,
              "folder_ids": folder_ids
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end