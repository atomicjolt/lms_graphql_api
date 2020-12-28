require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasScopeInput < BaseInputObject
        description "API Token Scopes. API Docs: https://canvas.instructure.com/doc/api/api_token_scopes.html"
      argument :resource, String, "The resource the scope is associated with.Example: courses", required: false
      argument :resource_name, String, "The localized resource name.Example: Courses", required: false
      argument :controller, String, "The controller the scope is associated to.Example: courses", required: false
      argument :action, String, "The controller action the scope is associated to.Example: index", required: false
      argument :verb, String, "The HTTP verb for the scope.Example: GET", required: false
      argument :scope, String, "The identifier for the scope.Example: url:GET|/api/v1/courses", required: false

      end
    end
  end
end