require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasScope < BaseType
          description "API Token Scopes. API Docs: https://canvas.instructure.com/doc/api/api_token_scopes.html"
        field :resource, String, "The resource the scope is associated with.Example: courses", null: true
        field :resource_name, String, "The localized resource name.Example: Courses", null: true
        field :controller, String, "The controller the scope is associated to.Example: courses", null: true
        field :action, String, "The controller action the scope is associated to.Example: index", null: true
        field :verb, String, "The HTTP verb for the scope.Example: GET", null: true
        field :scope, String, "The identifier for the scope.Example: url:GET|/api/v1/courses", null: true

      end
    end
  end
end