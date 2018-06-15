require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateFolderGroup < CanvasBaseMutation
        argument :group_id, ID, required: true
        argument :name, String, required: true
        argument :parent_folder_id, ID, required: false
        argument :parent_folder_path, String, required: false
        argument :lock_at, LMSGraphQL::Types::DateTimeType, required: false
        argument :unlock_at, LMSGraphQL::Types::DateTimeType, required: false
        argument :locked, Boolean, required: false
        argument :hidden, Boolean, required: false
        argument :position, Int, required: false
        field :folder, LMSGraphQL::Types::Canvas::CanvasFolder, null: false
        def resolve(group_id:, name:, parent_folder_id: nil, parent_folder_path: nil, lock_at: nil, unlock_at: nil, locked: nil, hidden: nil, position: nil)
          context[:canvas_api].call("CREATE_FOLDER_GROUPS").proxy(
            "CREATE_FOLDER_GROUPS",
            {
              "group_id": group_id,
              "name": name,
              "parent_folder_id": parent_folder_id,
              "parent_folder_path": parent_folder_path,
              "lock_at": lock_at,
              "unlock_at": unlock_at,
              "locked": locked,
              "hidden": hidden,
              "position": position            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end