require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
        class GroupMembershipWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "accepted"
          value "invited"
          value "requested"
        end
      class CanvasGroupMembershipInput < BaseInputObject
        description "Groups. API Docs: https://canvas.instructure.com/doc/api/groups.html"
        argument :id, ID, "The id of the membership object.Example: 92", required: false
        argument :group_id, ID, "The id of the group object to which the membership belongs.Example: 17", required: false
        argument :user_id, ID, "The id of the user object to which the membership belongs.Example: 3", required: false
        argument :workflow_state, GroupMembershipWorkflowStateEnum, "The current state of the membership. Current possible values are 'accepted', 'invited', and 'requested'.Example: accepted", required: false
        argument :moderator, Boolean, "Whether or not the user is a moderator of the group (the must also be an active member of the group to moderate).Example: true", required: false
        argument :just_created, Boolean, "optional: whether or not the record was just created on a create call (POST), i.e. was the user just added to the group, or was the user already a member.Example: true", required: false
        argument :sis_import_id, ID, "The id of the SIS import if created through SIS. Only included if the user has permission to manage SIS information..Example: 4", required: false

      end
    end
  end
end