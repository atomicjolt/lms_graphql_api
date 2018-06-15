require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFolderFolder < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::Folder, null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].proxy(
            "GET_FOLDER_FOLDERS",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end