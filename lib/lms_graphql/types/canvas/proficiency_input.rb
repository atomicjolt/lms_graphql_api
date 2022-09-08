require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasProficiencyInput < BaseInputObject
          description "Proficiency Ratings. API Docs: https://canvas.instructure.com/doc/api/proficiency_ratings.html"
        argument :ratings, [String], "An array of proficiency ratings. See the ProficiencyRating specification above..", required: false

      end
    end
  end
end