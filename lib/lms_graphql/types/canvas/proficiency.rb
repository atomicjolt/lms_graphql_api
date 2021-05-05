require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasProficiency < BaseType
          description "Proficiency Ratings. API Docs: https://canvas.instructure.com/doc/api/proficiency_ratings.html"
        field :ratings, String, "An array of proficiency ratings. See the ProficiencyRating specification above..", null: true

      end
    end
  end
end