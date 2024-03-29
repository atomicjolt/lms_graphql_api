require_relative "../canvas_base_type"
require_relative "module_item"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasModule < BaseType
          class ModuleWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "active"
          value "deleted"
        end

                class ModuleStateEnum < ::GraphQL::Schema::Enum
          value "locked"
          value "unlocked"
          value "started"
          value "completed"
        end
        description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
        field :id, ID, "the unique identifier for the module.Example: 123", null: true
        field :workflow_state, ModuleWorkflowStateEnum, "the state of the module: 'active', 'deleted'.Example: active", null: true
        field :position, Int, "the position of this module in the course (1-based).Example: 2", null: true
        field :name, String, "the name of this module.Example: Imaginary Numbers and You", null: true
        field :unlock_at, GraphQL::Types::ISO8601DateTime, "(Optional) the date this module will unlock.Example: 2012-12-31T06:00:00-06:00", null: true
        field :require_sequential_progress, Boolean, "Whether module items must be unlocked in order.Example: true", null: true
        field :prerequisite_module_ids, [ID], "IDs of Modules that must be completed before this one is unlocked.Example: 121, 122", null: true
        field :items_count, Int, "The number of items in the module.Example: 10", null: true
        field :items_url, String, "The API URL to retrive this module's items.Example: https://canvas.example.com/api/v1/modules/123/items", null: true
        field :items, [LMSGraphQL::Types::Canvas::CanvasModuleItem], "The contents of this module, as an array of Module Items. (Present only if requested via include[]=items AND the module is not deemed too large by Canvas.).", null: true
        field :state, ModuleStateEnum, "The state of this Module for the calling user one of 'locked', 'unlocked', 'started', 'completed' (Optional; present only if the caller is a student or if the optional parameter 'student_id' is included).Example: started", null: true
        field :completed_at, GraphQL::Types::ISO8601DateTime, "the date the calling user completed the module (Optional; present only if the caller is a student or if the optional parameter 'student_id' is included).", null: true
        field :publish_final_grade, Boolean, "if the student's final grade for the course should be published to the SIS upon completion of this module.", null: true
        field :published, Boolean, "(Optional) Whether this module is published. This field is present only if the caller has permission to view unpublished modules..Example: true", null: true

      end
    end
  end
end