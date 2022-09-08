require_relative "../canvas_base_input_type"
require_relative "lock_info"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasContentDetailInput < BaseInputObject
          description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
        argument :points_possible, Int, "Example: 20", required: false
        argument :due_at, GraphQL::Types::ISO8601DateTime, "Example: 2012-12-31T06:00:00-06:00", required: false
        argument :unlock_at, GraphQL::Types::ISO8601DateTime, "Example: 2012-12-31T06:00:00-06:00", required: false
        argument :lock_at, GraphQL::Types::ISO8601DateTime, "Example: 2012-12-31T06:00:00-06:00", required: false
        argument :locked_for_user, Boolean, "Example: true", required: false
        argument :lock_explanation, String, "Example: This quiz is part of an unpublished module and is not available yet.", required: false
        argument :lock_info, LMSGraphQL::Types::Canvas::CanvasLockInfoInput, "Example: assignment_4, 2012-12-31T06:00:00-06:00, 2012-12-31T06:00:00-06:00, {}", required: false

      end
    end
  end
end