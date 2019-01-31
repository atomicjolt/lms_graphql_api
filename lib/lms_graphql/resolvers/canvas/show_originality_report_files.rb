require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/originality_report"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowOriginalityReportFile < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasOriginalityReport, null: false
        argument :assignment_id, ID, required: true
        argument :file_id, ID, required: true
        def resolve(assignment_id:, file_id:, get_all: false)
          result = context[:canvas_api].call("SHOW_ORIGINALITY_REPORT_FILES").proxy(
            "SHOW_ORIGINALITY_REPORT_FILES",
            {
              "assignment_id": assignment_id,
              "file_id": file_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end