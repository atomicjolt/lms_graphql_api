require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasBlueprintRestrictionInput < BaseInputObject
          description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
      argument :content, Boolean, "Restriction on main content (e.g. title, description)..Example: true", required: false
      argument :points, Boolean, "Restriction on points possible for assignments and graded learning objects.Example: true", required: false
      argument :due_dates, Boolean, "Restriction on due dates for assignments and graded learning objects.", required: false
      argument :availability_dates, Boolean, "Restriction on availability dates for an object.Example: true", required: false

      end
    end
  end
end