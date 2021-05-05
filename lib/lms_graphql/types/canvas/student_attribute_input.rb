require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasStudentAttributeInput < BaseInputObject
          description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
      argument :user_id, ID, "The unique Canvas identifier for the user.Example: 511", required: false
      argument :sis_user_id, ID, "The SIS ID associated with the user.  This field is only included if the user came from a SIS import and has permissions to view SIS information..Example: SHEL93921", required: false

      end
    end
  end
end