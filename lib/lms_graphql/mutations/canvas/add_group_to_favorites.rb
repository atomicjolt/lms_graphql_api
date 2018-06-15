require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/favorite"
module LMSGraphQL
  module Mutations
    module Canvas
      class AddGroupToFavorite < BaseMutation
        argument :id, ID, required: true
        field :favorite, LMSGraphQL::Types::Canvas::CanvasFavorite, null: false
        def resolve(id:)
          context[:canvas_api].call("ADD_GROUP_TO_FAVORITES").proxy(
            "ADD_GROUP_TO_FAVORITES",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end