require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasFavoriteInput < BaseInputObject
          class FavoriteInputContextTypeEnum < ::GraphQL::Schema::Enum
          value "Course"
        end
        description "Favorites. API Docs: https://canvas.instructure.com/doc/api/favorites.html"
      argument :context_id, ID, "The ID of the object the Favorite refers to.Example: 1170", required: false
      argument :context_type, FavoriteInputContextTypeEnum, "The type of the object the Favorite refers to (currently, only 'Course' is supported).Example: Course", required: false

      end
    end
  end
end