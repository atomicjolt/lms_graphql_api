require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasPlannerOverrideInput < BaseInputObject
        description "Planner. API Docs: https://canvas.instructure.com/doc/api/planner.html"
        argument :id, ID, "The ID of the planner override.Example: 234", required: false
        argument :plannable_type, String, "The type of the associated object for the planner override.Example: Assignment", required: false
        argument :plannable_id, ID, "The id of the associated object for the planner override.Example: 1578941", required: false
        argument :user_id, ID, "The id of the associated user for the planner override.Example: 1578941", required: false
        argument :assignment_id, ID, "The id of the plannable's associated assignment, if it has one.Example: 1578941", required: false
        argument :workflow_state, String, "The current published state of the item, synced with the associated object.Example: published", required: false
        argument :marked_complete, Boolean, "Controls whether or not the associated plannable item is marked complete on the planner.", required: false
        argument :dismissed, Boolean, "Controls whether or not the associated plannable item shows up in the opportunities list.", required: false
        argument :created_at, LMSGraphQL::Types::DateTimeType, "The datetime of when the planner override was created.Example: 2017-05-09T10:12:00Z", required: false
        argument :updated_at, LMSGraphQL::Types::DateTimeType, "The datetime of when the planner override was updated.Example: 2017-05-09T10:12:00Z", required: false
        argument :deleted_at, LMSGraphQL::Types::DateTimeType, "The datetime of when the planner override was deleted, if applicable.Example: 2017-05-15T12:12:00Z", required: false

      end
    end
  end
end