require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasLicenseInput < BaseInputObject
          description "Files. API Docs: https://canvas.instructure.com/doc/api/files.html"
        argument :id, ID, "a short string identifying the license.Example: cc_by_sa", required: false
        argument :name, String, "the name of the license.Example: CC Attribution ShareAlike", required: false
        argument :url, String, "a link to the license text.Example: http://creativecommons.org/licenses/by-sa/4.0", required: false

      end
    end
  end
end