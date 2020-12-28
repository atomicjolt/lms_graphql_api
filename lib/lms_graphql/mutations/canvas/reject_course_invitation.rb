require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class RejectCourseInvitation < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, id:)
          context[:canvas_api].call("REJECT_COURSE_INVITATION").proxy(
            "REJECT_COURSE_INVITATION",
            {
              "course_id": course_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end