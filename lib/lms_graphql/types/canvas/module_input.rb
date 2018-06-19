require_relative "../canvas_base_input_type"
require_relative "module_item_input"

module LMSGraphQL
  module Types
    module Canvas
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
      class CanvasModuleInput < BaseInputObject
        description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
        argument :id, ID, "the unique identifier for the module.Example: 123", required: false
        argument :workflow_state, ModuleWorkflowStateEnum, "the state of the module: 'active', 'deleted'.Example: active", required: false
        argument :position, Int, "the position of this module in the course (1-based).Example: 2", required: false
        argument :name, String, "the name of this module.Example: Imaginary Numbers and You", required: false
        argument :unlock_at, LMSGraphQL::Types::DateTimeType, "(Optional) the date this module will unlock.Example: 2012-12-31T06:00:00-06:00", required: false
        argument :require_sequential_progress, Boolean, "Whether module items must be unlocked in order.Example: true", required: false
        argument :prerequisite_module_ids, [ID], "IDs of Modules that must be completed before this one is unlocked.Example: 121, 122", required: false
        argument :items_count, Int, "The number of items in the module.Example: 10", required: false
        argument :items_url, String, "The API URL to retrive this module's items.Example: https://canvas.example.com/api/v1/modules/123/items", required: false
        argument :items, [LMSGraphQL::Types::Canvas::CanvasModuleItemInput], "The contents of this module, as an array of Module Items. (Present only if requested via include[]=items AND the module is not deemed too large by Canvas.).", required: false
        argument :state, ModuleStateEnum, "The state of this Module for the calling user one of 'locked', 'unlocked', 'started', 'completed' (Optional; present only if the caller is a student or if the optional parameter 'student_id' is included).Example: started", required: false
        argument :completed_at, LMSGraphQL::Types::DateTimeType, "the date the calling user completed the module (Optional; present only if the caller is a student or if the optional parameter 'student_id' is included).", required: false
        argument :publish_final_grade, Boolean, "if the student's final grade for the course should be published to the SIS upon completion of this module.", required: false
        argument :published, Boolean, "(Optional) Whether this module is published. This field is present only if the caller has permission to view unpublished modules..Example: true", required: false

      end
    end
  end
end