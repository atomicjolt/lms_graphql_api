require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetUploadedMediaFolderForUserGroup < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFolder, null: false
        argument :group_id, ID, required: true
        def resolve(group_id:, get_all: false)
          result = context[:canvas_api].call("GET_UPLOADED_MEDIA_FOLDER_FOR_USER_GROUPS").proxy(
            "GET_UPLOADED_MEDIA_FOLDER_FOR_USER_GROUPS",
            {
              "group_id": group_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end