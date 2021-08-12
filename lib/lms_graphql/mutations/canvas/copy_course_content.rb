require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CopyCourseContent < BaseMutation
        argument :course_id, ID, required: true
        argument :source_course, String, required: false
        argument :except, [String], required: false
        argument :only, [String], required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, source_course: nil, except: nil, only: nil)
          context[:canvas_api].call("COPY_COURSE_CONTENT").proxy(
            "COPY_COURSE_CONTENT",
            {
              "course_id": course_id
            },
            {
              "source_course": source_course,
              "except": except,
              "only": only
            },
          ).parsed_response
        end
      end
    end
  end
end