require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/favorite"
module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveCourseFromFavorite < BaseMutation
        argument :id, ID, required: true
        field :favorite, LMSGraphQL::Types::Canvas::CanvasFavorite, null: false
        def resolve(id:)
          context[:canvas_api].call("REMOVE_COURSE_FROM_FAVORITES").proxy(
            "REMOVE_COURSE_FROM_FAVORITES",
            {
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end