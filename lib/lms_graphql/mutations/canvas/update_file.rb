require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/file"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateFile < BaseMutation
        argument :id, ID, required: true
        argument :name, String, required: false
        argument :parent_folder_id, ID, required: false
        argument :on_duplicate, String, required: false
        argument :lock_at, LMSGraphQL::Types::DateTimeType, required: false
        argument :unlock_at, LMSGraphQL::Types::DateTimeType, required: false
        argument :locked, Boolean, required: false
        argument :hidden, Boolean, required: false
        
        
        field :file, LMSGraphQL::Types::Canvas::CanvasFile, null: false
        
        def resolve(id:, name: nil, parent_folder_id: nil, on_duplicate: nil, lock_at: nil, unlock_at: nil, locked: nil, hidden: nil)
          context[:canvas_api].call("UPDATE_FILE").proxy(
            "UPDATE_FILE",
            {
              "id": id
            },
            {
              "name": name,
              "parent_folder_id": parent_folder_id,
              "on_duplicate": on_duplicate,
              "lock_at": lock_at,
              "unlock_at": unlock_at,
              "locked": locked,
              "hidden": hidden
            },
          ).parsed_response
        end
      end
    end
  end
end