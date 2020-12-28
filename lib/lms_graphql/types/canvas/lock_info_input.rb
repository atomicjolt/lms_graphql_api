require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasLockInfoInput < BaseInputObject
        description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
      argument :asset_string, String, "Asset string for the object causing the lock.Example: assignment_4", required: false
      argument :unlock_at, LMSGraphQL::Types::DateTimeType, "(Optional) Time at which this was/will be unlocked. Must be before the due date..Example: 2013-01-01T00:00:00-06:00", required: false
      argument :lock_at, LMSGraphQL::Types::DateTimeType, "(Optional) Time at which this was/will be locked. Must be after the due date..Example: 2013-02-01T00:00:00-06:00", required: false
      argument :context_module, String, "(Optional) Context module causing the lock..Example: {}", required: false
      argument :manually_locked, Boolean, "Example: true", required: false

      end
    end
  end
end