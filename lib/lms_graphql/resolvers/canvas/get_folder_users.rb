require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFolderUser < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFolder, null: false
        argument :user_id, ID, required: true
        argument :id, ID, required: true
        def resolve(user_id:, id:)
          context[:canvas_api].call("GET_FOLDER_USERS").proxy(
            "GET_FOLDER_USERS",
            {
              "user_id": user_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end