require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/custom_column"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateCustomGradebookColumn < BaseMutation
        argument :course_id, ID, required: true
        argument :column_title, String, required: true
        argument :column_position, Int, required: false
        argument :column_hidden, Boolean, required: false
        argument :column_teacher_notes, Boolean, required: false
        argument :column_read_only, Boolean, required: false
        
        
        field :custom_column, LMSGraphQL::Types::Canvas::CanvasCustomColumn, null: false
        
        def resolve(course_id:, column_title:, column_position: nil, column_hidden: nil, column_teacher_notes: nil, column_read_only: nil)
          context[:canvas_api].call("CREATE_CUSTOM_GRADEBOOK_COLUMN").proxy(
            "CREATE_CUSTOM_GRADEBOOK_COLUMN",
            {
              "course_id": course_id
            },
            {
              "column[title]": column_title,
              "column[position]": column_position,
              "column[hidden]": column_hidden,
              "column[teacher_notes]": column_teacher_notes,
              "column[read_only]": column_read_only
            },
          ).parsed_response
        end
      end
    end
  end
end