require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizIPFilterInput < BaseInputObject
        description "Quiz IP Filters. API Docs: https://canvas.instructure.com/doc/api/quiz_ip_filters.html"
        argument :name, String, "A unique name for the filter..Example: Current Filter", required: false
        argument :account, String, "Name of the Account (or Quiz) the IP filter is defined in..Example: Some Quiz", required: false
        argument :filter, String, "An IP address (or range mask) this filter embodies..Example: 192.168.1.1/24", required: false

      end
    end
  end
end