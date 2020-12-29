require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveUsageRightsCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :file_ids, [ID], required: true
        argument :folder_ids, [ID], required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, file_ids:, folder_ids: nil)
          context[:canvas_api].call("REMOVE_USAGE_RIGHTS_COURSES").proxy(
            "REMOVE_USAGE_RIGHTS_COURSES",
            {
              "course_id": course_id,
              "file_ids": file_ids,
              "folder_ids": folder_ids
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end