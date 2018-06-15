require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
        class FavoriteContextTypeEnum < ::GraphQL::Schema::Enum
          value "Course"
        end
      class Favorite < BaseType
        description "Favorites. API Docs: https://canvas.instructure.com/doc/api/favorites.html"
        field :context_id, ID, "The ID of the object the Favorite refers to.Example: 1170", null: true
        field :context_type, FavoriteContextTypeEnum, "The type of the object the Favorite refers to (currently, only 'Course' is supported).Example: Course", null: true

      end
    end
  end
end