require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateBookmark < BaseMutation
        argument :id, ID, required: true
        argument :name, String, required: false
        argument :url, String, required: false
        argument :position, Int, required: false
        argument :data, String, required: false
        
        
        field :folder, LMSGraphQL::Types::Canvas::CanvasFolder, null: false
        
        def resolve(id:, name: nil, url: nil, position: nil, data: nil)
          context[:canvas_api].call("UPDATE_BOOKMARK").proxy(
            "UPDATE_BOOKMARK",
            {
              "id": id
            },
            {
              "name": name,
              "url": url,
              "position": position,
              "data": data
            },
          ).parsed_response
        end
      end
    end
  end
end