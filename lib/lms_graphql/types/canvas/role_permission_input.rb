require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasRolePermissionInput < BaseInputObject
        description "Roles. API Docs: https://canvas.instructure.com/doc/api/roles.html"
      argument :enabled, Boolean, "Whether the role has the permission.Example: true", required: false
      argument :locked, Boolean, "Whether the permission is locked by this role.", required: false
      argument :applies_to_self, Boolean, "Whether the permission applies to the account this role is in. Only present if enabled is true.Example: true", required: false
      argument :applies_to_descendants, Boolean, "Whether the permission cascades down to sub accounts of the account this role is in. Only present if enabled is true.", required: false
      argument :readonly, Boolean, "Whether the permission can be modified in this role (i.e. whether the permission is locked by an upstream role)..", required: false
      argument :explicit, Boolean, "Whether the value of enabled is specified explicitly by this role, or inherited from an upstream role..Example: true", required: false
      argument :prior_default, Boolean, "The value that would have been inherited from upstream if the role had not explicitly set a value. Only present if explicit is true..", required: false

      end
    end
  end
end