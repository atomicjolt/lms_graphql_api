require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasBlueprintSubscription < BaseType
        description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
      	field :id, ID, "The ID of the blueprint course subscription.Example: 101", null: true
      	field :template_id, ID, "The ID of the blueprint template the associated course is subscribed to.Example: 1", null: true
      	field :blueprint_course, String, "The blueprint course subscribed to.Example: 2, Biology 100 Blueprint, BIOL 100 BP, Default term", null: true

      end
    end
  end
end