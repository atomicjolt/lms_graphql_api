require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasProficiencyRatingInput < BaseInputObject
        description "Proficiency Ratings. API Docs: https://canvas.instructure.com/doc/api/proficiency_ratings.html"
        argument :description, String, "The description of the rating.Example: Exceeds Mastery", required: false
        argument :points, Float, "A non-negative number of points for the rating.Example: 4", required: false
        argument :mastery, Boolean, "Indicates the rating where mastery is first achieved.", required: false
        argument :color, String, "The hex color code of the rating.Example: 127A1B", required: false

      end
    end
  end
end