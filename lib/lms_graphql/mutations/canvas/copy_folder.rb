require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Mutations
    module Canvas
      class CopyFolder < BaseMutation
        argument :dest_folder_id, ID, required: true
        argument :source_folder_id, ID, required: true
        
        
        field :folder, LMSGraphQL::Types::Canvas::CanvasFolder, null: false
        
        def resolve(dest_folder_id:, source_folder_id:)
          context[:canvas_api].call("COPY_FOLDER").proxy(
            "COPY_FOLDER",
            {
              "dest_folder_id": dest_folder_id
            },
            {
              "source_folder_id": source_folder_id
            },
          ).parsed_response
        end
      end
    end
  end
end