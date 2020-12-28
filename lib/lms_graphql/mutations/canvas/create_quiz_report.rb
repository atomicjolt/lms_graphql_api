require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/quiz_report"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateQuizReport < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :quiz_report_report_type, String, required: true
        argument :quiz_report_includes_all_versions, Boolean, required: false
        argument :include, String, required: false
        
        
        field :quiz_report, LMSGraphQL::Types::Canvas::CanvasQuizReport, null: false
        
        def resolve(course_id:, quiz_id:, quiz_report_report_type:, quiz_report_includes_all_versions: nil, include: nil)
          context[:canvas_api].call("CREATE_QUIZ_REPORT").proxy(
            "CREATE_QUIZ_REPORT",
            {
              "course_id": course_id,
              "quiz_id": quiz_id
            },
            {
              "quiz_report[report_type]": quiz_report_report_type,
              "quiz_report[includes_all_versions]": quiz_report_includes_all_versions,
              "include": include
            },
          ).parsed_response
        end
      end
    end
  end
end