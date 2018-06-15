require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/file"
module LMSGraphQL
  module Mutations
    module Canvas
      class CopyFile < BaseMutation
        argument :dest_folder_id, ID, required: true
        argument :source_file_id, ID, required: true
        argument :on_duplicate, String, required: false
        field :file, LMSGraphQL::Types::Canvas::CanvasFile, null: false
        def resolve(dest_folder_id:, source_file_id:, on_duplicate: nil)
          context[:canvas_api].call("COPY_FILE").proxy(
            "COPY_FILE",
            {
              "dest_folder_id": dest_folder_id,
              "source_file_id": source_file_id,
              "on_duplicate": on_duplicate            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end