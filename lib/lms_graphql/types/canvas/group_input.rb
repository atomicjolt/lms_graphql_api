require_relative "../canvas_base_input_type"
require_relative "user"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasGroupInput < BaseInputObject
          class GroupInputJoinLevelEnum < ::GraphQL::Schema::Enum
          value "parent_context_auto_join"
          value "parent_context_request"
          value "invitation_only"
        end

                class GroupInputRoleEnum < ::GraphQL::Schema::Enum
          value "communities"
          value "student_organized"
          value "imported"
        end
        description "Groups. API Docs: https://canvas.instructure.com/doc/api/groups.html"
        argument :id, ID, "The ID of the group..Example: 17", required: false
        argument :name, String, "The display name of the group..Example: Math Group 1", required: false
        argument :description, String, "A description of the group. This is plain text..", required: false
        argument :is_public, Boolean, "Whether or not the group is public.  Currently only community groups can be made public.  Also, once a group has been set to public, it cannot be changed back to private..", required: false
        argument :followed_by_user, Boolean, "Whether or not the current user is following this group..", required: false
        argument :join_level, GroupInputJoinLevelEnum, "How people are allowed to join the group.  For all groups except for community groups, the user must share the group's parent course or account.  For student organized or community groups, where a user can be a member of as many or few as they want, the applicable levels are 'parent_context_auto_join', 'parent_context_request', and 'invitation_only'.  For class groups, where students are divided up and should only be part of one group of the category, this value will always be 'invitation_only', and is not relevant. * If 'parent_context_auto_join', anyone can join and will be automatically accepted. * If 'parent_context_request', anyone  can request to join, which must be approved by a group moderator. * If 'invitation_only', only those how have received an invitation my join the group, by accepting that invitation..Example: invitation_only", required: false
        argument :members_count, Int, "The number of members currently in the group.Example: 0", required: false
        argument :avatar_url, String, "The url of the group's avatar.Example: https://<canvas>/files/avatar_image.png", required: false
        argument :context_type, String, "The course or account that the group belongs to. The pattern here is that whatever the context_type is, there will be an _id field named after that type. So if instead context_type was 'account', the course_id field would be replaced by an account_id field..Example: Course", required: false
        argument :course_id, ID, "Example: 3", required: false
        argument :role, GroupInputRoleEnum, "Certain types of groups have special role designations. Currently, these include: 'communities', 'student_organized', and 'imported'. Regular course/account groups have a role of null..", required: false
        argument :group_category_id, ID, "The ID of the group's category..Example: 4", required: false
        argument :sis_group_id, ID, "The SIS ID of the group. Only included if the user has permission to view SIS information..Example: group4a", required: false
        argument :sis_import_id, ID, "The id of the SIS import if created through SIS. Only included if the user has permission to manage SIS information..Example: 14", required: false
        argument :storage_quota_mb, Int, "the storage quota for the group, in megabytes.Example: 50", required: false
        argument :permissions, String, "optional: the permissions the user has for the group. returned only for a single group and include[]=permissions.Example: true, true", required: false
        argument :users, [LMSGraphQL::Types::Canvas::CanvasUserInput], "optional: A list of users that are members in the group. Returned only if include[]=users. WARNING: this collection's size is capped (if there are an extremely large number of users in the group (thousands) not all of them will be returned).  If you need to capture all the users in a group with certainty consider using the paginated /api/v1/groups/<group_id>/memberships endpoint..", required: false

      end
    end
  end
end