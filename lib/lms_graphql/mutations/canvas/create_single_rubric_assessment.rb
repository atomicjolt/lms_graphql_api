require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CreateSingleRubricAssessment < BaseMutation
        argument :course_id, ID, required: true
        argument :rubric_association_id, ID, required: true
        argument :provisional, String, required: false
        argument :final, String, required: false
        argument :graded_anonymously, Boolean, required: false
        argument :rubric_assessment, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, rubric_association_id:, provisional: nil, final: nil, graded_anonymously: nil, rubric_assessment: nil)
          context[:canvas_api].call("CREATE_SINGLE_RUBRIC_ASSESSMENT").proxy(
            "CREATE_SINGLE_RUBRIC_ASSESSMENT",
            {
              "course_id": course_id,
              "rubric_association_id": rubric_association_id
            },
            {
              "provisional": provisional,
              "final": final,
              "graded_anonymously": graded_anonymously,
              "rubric_assessment": rubric_assessment
            },
          ).parsed_response
        end
      end
    end
  end
end