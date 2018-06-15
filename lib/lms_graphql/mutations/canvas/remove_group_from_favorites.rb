require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/favorite"
module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveGroupFromFavorite < BaseMutation
        argument :id, ID, required: true
        field :favorite, LMSGraphQL::Types::Canvas::CanvasFavorite, null: false
        def resolve(id:)
          context[:canvas_api].call("REMOVE_GROUP_FROM_FAVORITES").proxy(
            "REMOVE_GROUP_FROM_FAVORITES",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end