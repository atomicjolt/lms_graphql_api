require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasBlueprintSubscriptionInput < BaseInputObject
        description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
      argument :id, ID, "The ID of the blueprint course subscription.Example: 101", required: false
      argument :template_id, ID, "The ID of the blueprint template the associated course is subscribed to.Example: 1", required: false
      argument :blueprint_course, String, "The blueprint course subscribed to.Example: 2, Biology 100 Blueprint, BIOL 100 BP, Default term", required: false

      end
    end
  end
end