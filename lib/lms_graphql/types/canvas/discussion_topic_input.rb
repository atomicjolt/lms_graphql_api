require_relative "../canvas_base_input_type"
require_relative "lock_info_input"
require_relative "file_attachment_input"

module LMSGraphQL
  module Types
    module Canvas
        class DiscussionTopicReadStateEnum < ::GraphQL::Schema::Enum
          value "read"
          value "unread"
        end

                class DiscussionTopicSubscriptionHoldEnum < ::GraphQL::Schema::Enum
          value "initial_post_required"
          value "not_in_group_set"
          value "not_in_group"
          value "topic_is_announcement"
        end

                class DiscussionTopicDiscussionTypeEnum < ::GraphQL::Schema::Enum
          value "side_comment"
          value "threaded"
        end
      class CanvasDiscussionTopicInput < BaseInputObject
        description "Discussion Topics. API Docs: https://canvas.instructure.com/doc/api/discussion_topics.html"
        argument :id, ID, "The ID of this topic..Example: 1", required: false
        argument :title, String, "The topic title..Example: Topic 1", required: false
        argument :message, String, "The HTML content of the message body..Example: <p>content here</p>", required: false
        argument :html_url, String, "The URL to the discussion topic in canvas..Example: https://<canvas>/courses/1/discussion_topics/2", required: false
        argument :posted_at, LMSGraphQL::Types::DateTimeType, "The datetime the topic was posted. If it is null it hasn't been posted yet. (see delayed_post_at).Example: 2037-07-21T13:29:31Z", required: false
        argument :last_reply_at, LMSGraphQL::Types::DateTimeType, "The datetime for when the last reply was in the topic..Example: 2037-07-28T19:38:31Z", required: false
        argument :require_initial_post, Boolean, "If true then a user may not respond to other replies until that user has made an initial reply. Defaults to false..", required: false
        argument :user_can_see_posts, Boolean, "Whether or not posts in this topic are visible to the user..Example: true", required: false
        argument :discussion_subentry_count, Int, "The count of entries in the topic..Example: 0", required: false
        argument :read_state, DiscussionTopicReadStateEnum, "The read_state of the topic for the current user, 'read' or 'unread'..Example: read", required: false
        argument :unread_count, Int, "The count of unread entries of this topic for the current user..Example: 0", required: false
        argument :subscribed, Boolean, "Whether or not the current user is subscribed to this topic..Example: true", required: false
        argument :subscription_hold, DiscussionTopicSubscriptionHoldEnum, "(Optional) Why the user cannot subscribe to this topic. Only one reason will be returned even if multiple apply. Can be one of: 'initial_post_required': The user must post a reply first; 'not_in_group_set': The user is not in the group set for this graded group discussion; 'not_in_group': The user is not in this topic's group; 'topic_is_announcement': This topic is an announcement.Example: not_in_group_set", required: false
        argument :assignment_id, ID, "The unique identifier of the assignment if the topic is for grading, otherwise null..", required: false
        argument :delayed_post_at, LMSGraphQL::Types::DateTimeType, "The datetime to publish the topic (if not right away)..", required: false
        argument :published, Boolean, "Whether this discussion topic is published (true) or draft state (false).Example: true", required: false
        argument :lock_at, LMSGraphQL::Types::DateTimeType, "The datetime to lock the topic (if ever)..", required: false
        argument :locked, Boolean, "Whether or not the discussion is 'closed for comments'..", required: false
        argument :pinned, Boolean, "Whether or not the discussion has been 'pinned' by an instructor.", required: false
        argument :locked_for_user, Boolean, "Whether or not this is locked for the user..Example: true", required: false
        argument :lock_info, LMSGraphQL::Types::Canvas::CanvasLockInfoInput, "(Optional) Information for the user about the lock. Present when locked_for_user is true..", required: false
        argument :lock_explanation, String, "(Optional) An explanation of why this is locked for the user. Present when locked_for_user is true..Example: This discussion is locked until September 1 at 12:00am", required: false
        argument :user_name, String, "The username of the topic creator..Example: User Name", required: false
        argument :topic_children, Int, "DEPRECATED An array of topic_ids for the group discussions the user is a part of..Example: 5, 7, 10", required: false
        argument :group_topic_children, String, "An array of group discussions the user is a part of. Fields include: id, group_id.Example: {'id'=>5, 'group_id'=>1}, {'id'=>7, 'group_id'=>5}, {'id'=>10, 'group_id'=>4}", required: false
        argument :root_topic_id, ID, "If the topic is for grading and a group assignment this will point to the original topic in the course..", required: false
        argument :podcast_url, String, "If the topic is a podcast topic this is the feed url for the current user..Example: /feeds/topics/1/enrollment_1XAcepje4u228rt4mi7Z1oFbRpn3RAkTzuXIGOPe.rss", required: false
        argument :discussion_type, DiscussionTopicDiscussionTypeEnum, "The type of discussion. Values are 'side_comment', for discussions that only allow one level of nested comments, and 'threaded' for fully threaded discussions..Example: side_comment", required: false
        argument :group_category_id, ID, "The unique identifier of the group category if the topic is a group discussion, otherwise null..", required: false
        argument :attachments, [LMSGraphQL::Types::Canvas::CanvasFileAttachmentInput], "Array of file attachments..", required: false
        argument :permissions, String, "The current user's permissions on this topic..Example: true", required: false
        argument :allow_rating, Boolean, "Whether or not users can rate entries in this topic..Example: true", required: false
        argument :only_graders_can_rate, Boolean, "Whether or not grade permissions are required to rate entries..Example: true", required: false
        argument :sort_by_rating, Boolean, "Whether or not entries should be sorted by rating..Example: true", required: false

      end
    end
  end
end