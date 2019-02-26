require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class FilesUploadFile < BaseMutation
        argument :folder_id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(folder_id:)
          context[:canvas_api].call("FILES_UPLOAD_FILE").proxy(
            "FILES_UPLOAD_FILE",
            {
              "folder_id": folder_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end