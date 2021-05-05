require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasProficiencyRating < BaseType
          description "Proficiency Ratings. API Docs: https://canvas.instructure.com/doc/api/proficiency_ratings.html"
        field :description, String, "The description of the rating.Example: Exceeds Mastery", null: true
        field :points, Float, "A non-negative number of points for the rating.Example: 4", null: true
        field :mastery, Boolean, "Indicates the rating where mastery is first achieved.", null: true
        field :color, String, "The hex color code of the rating.Example: 127A1B", null: true

      end
    end
  end
end