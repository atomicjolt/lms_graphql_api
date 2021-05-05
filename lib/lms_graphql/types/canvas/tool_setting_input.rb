require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasToolSettingInput < BaseInputObject
          description "Originality Reports. API Docs: https://canvas.instructure.com/doc/api/originality_reports.html"
      argument :resource_type_code, String, "the resource type code of the resource handler to use to display originality reports.Example: originality_reports", required: false
      argument :resource_url, String, "a URL that may be used to override the launch URL inferred by the specified resource_type_code. If used a 'resource_type_code' must also be specified..Example: http://www.test.com/originality_report", required: false

      end
    end
  end
end