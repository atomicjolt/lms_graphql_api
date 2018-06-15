require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasScopeInput < BaseInputObject
        description "Scopes. API Docs: https://canvas.instructure.com/doc/api/scopes.html"
        argument :resource, String, "The resource the scope is associated with.Example: courses", required: false
        argument :verb, String, "The HTTP verb for the scope.Example: GET", required: false
        argument :scope, String, "The identifier for the scope.Example: url:GET|/api/v1/courses", required: false

      end
    end
  end
end