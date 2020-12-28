require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateFolder < BaseMutation
        argument :id, ID, required: true
        argument :name, String, required: false
        argument :parent_folder_id, ID, required: false
        argument :lock_at, LMSGraphQL::Types::DateTimeType, required: false
        argument :unlock_at, LMSGraphQL::Types::DateTimeType, required: false
        argument :locked, Boolean, required: false
        argument :hidden, Boolean, required: false
        argument :position, Int, required: false
        
        
        field :folder, LMSGraphQL::Types::Canvas::CanvasFolder, null: false
        
        def resolve(id:, name: nil, parent_folder_id: nil, lock_at: nil, unlock_at: nil, locked: nil, hidden: nil, position: nil)
          context[:canvas_api].call("UPDATE_FOLDER").proxy(
            "UPDATE_FOLDER",
            {
              "id": id
            },
            {
              "name": name,
              "parent_folder_id": parent_folder_id,
              "lock_at": lock_at,
              "unlock_at": unlock_at,
              "locked": locked,
              "hidden": hidden,
              "position": position
            },
          ).parsed_response
        end
      end
    end
  end
end