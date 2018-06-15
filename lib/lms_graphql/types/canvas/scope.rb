require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class Scope < BaseType
        description "Scopes. API Docs: https://canvas.instructure.com/doc/api/scopes.html"
        field :resource, String, "The resource the scope is associated with.Example: courses", null: true
        field :verb, String, "The HTTP verb for the scope.Example: GET", null: true
        field :scope, String, "The identifier for the scope.Example: url:GET|/api/v1/courses", null: true

      end
    end
  end
end