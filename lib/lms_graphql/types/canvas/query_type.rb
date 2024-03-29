require_relative "../../utils"
require_relative "../canvas_base_type"
require_all(File.absolute_path(__FILE__), "../../resolvers/canvas/")

module LMSGraphQL
  module Types
    module Canvas
      class QueryType < BaseType
        description "The root query of Canvas schema"
        field :list_available_account_calendars,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAvailableAccountCalendar,
          description: "List available account calendars. Returns a paginated list of account calendars available to the current user.   Includes visible account calendars where the user has an account association."

        field :get_single_account_calendar,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleAccountCalendar,
          description: "Get a single account calendar. Get details about a specific account calendar."

        field :list_all_account_calendars,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAllAccountCalendar,
          description: "List all account calendars. Returns a paginated list of account calendars for the provided account and   its first level of sub-accounts. Includes hidden calendars in the response.   Requires the `manage_account_calendar_visibility` permission."

        field :count_of_all_visible_account_calendars,
          resolver: LMSGraphQL::Resolvers::Canvas::CountOfAllVisibleAccountCalendar,
          description: "Count of all visible account calendars. Returns the number of visible account calendars."

        field :search_account_domains,
          resolver: LMSGraphQL::Resolvers::Canvas::SearchAccountDomain,
          description: "Search account domains. Returns a list of up to 5 matching account domains      Partial match on name / domain are supported"

        field :index_of_active_global_notification_for_user,
          resolver: LMSGraphQL::Resolvers::Canvas::IndexOfActiveGlobalNotificationForUser,
          description: "Index of active global notification for the user. Returns a list of all global notifications in the account for the current user   Any notifications that have been closed by the user will not be returned, unless   a include_past parameter is passed in as true."

        field :show_global_notification,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowGlobalNotification,
          description: "Show a global notification. Returns a global notification for the current user   A notification that has been closed by the user will not be returned"

        field :list_available_reports,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAvailableReport,
          description: "List Available Reports. Returns a paginated list of reports for the current context."

        field :index_of_reports,
          resolver: LMSGraphQL::Resolvers::Canvas::IndexOfReport,
          description: "Index of Reports. Shows all reports that have been run for the account of a specific type."

        field :status_of_report,
          resolver: LMSGraphQL::Resolvers::Canvas::StatusOfReport,
          description: "Status of a Report. Returns the status of a report."

        field :list_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAccount,
          description: "List accounts. A paginated list of accounts that the current user can view or manage.   Typically, students and even teachers will get an empty list in response,   only account admins can view the accounts that they are in."

        field :get_accounts_that_admins_can_manage,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAccountsThatAdminsCanManage,
          description: "Get accounts that admins can manage. A paginated list of accounts where the current user has permission to create   or manage courses. List will be empty for students and teachers as only admins   can view which accounts they are in."

        field :list_accounts_for_course_admins,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAccountsForCourseAdmin,
          description: "List accounts for course admins. A paginated list of accounts that the current user can view through their   admin course enrollments. (Teacher, TA, or designer enrollments).   Only returns 'id', 'name', 'workflow_state', 'root_account_id' and 'parent_account_id'"

        field :get_single_account,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleAccount,
          description: "Get a single account. Retrieve information on an individual account, given by id or sis   sis_account_id."

        field :settings,
          resolver: LMSGraphQL::Resolvers::Canvas::Setting,
          description: "Settings. Returns settings for the specified account as a JSON object. The caller must be an Account   admin with the manage_account_settings permission."

        field :permissions,
          resolver: LMSGraphQL::Resolvers::Canvas::Permission,
          description: "Permissions. Returns permission information for the calling user and the given account.   You may use `self` as the account id to check permissions against the domain root account.   The caller must have an account role or admin (teacher/TA/designer) enrollment in a course   in the account.      See also the {api:CoursesController#permissions Course} and {api:GroupsController#permissions Group}   counterparts."

        field :get_sub_accounts_of_account,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSubAccountsOfAccount,
          description: "Get the sub-accounts of an account. List accounts that are sub-accounts of the given account."

        field :get_terms_of_service,
          resolver: LMSGraphQL::Resolvers::Canvas::GetTermsOfService,
          description: "Get the Terms of Service. Returns the terms of service for that account"

        field :get_help_links,
          resolver: LMSGraphQL::Resolvers::Canvas::GetHelpLink,
          description: "Get help links. Returns the help links for that account"

        field :get_manually_created_courses_sub_account_for_domain_root_account,
          resolver: LMSGraphQL::Resolvers::Canvas::GetManuallyCreatedCoursesSubAccountForDomainRootAccount,
          description: "Get the manually-created courses sub-account for the domain root account. "

        field :list_active_courses_in_account,
          resolver: LMSGraphQL::Resolvers::Canvas::ListActiveCoursesInAccount,
          description: "List active courses in an account. Retrieve a paginated list of courses in this account."

        field :get_account,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAccount,
          description: "Get account. Retrieve information on an individual account, given by local or global ID."

        field :list_account_admins,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAccountAdmin,
          description: "List account admins. A paginated list of the admins in the account"

        field :get_department_level_participation_data_terms,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelParticipationDataTerm,
          description: "Get department-level participation data. Returns page view hits summed across all courses in the department. Two   groupings of these counts are returned; one by day (+by_date+), the other   by category (+by_category+). The possible categories are announcements,   assignments, collaborations, conferences, discussions, files, general,   grades, groups, modules, other, pages, and quizzes.      This and the other department-level endpoints have three variations which   all return the same style of data but for different subsets of courses. All   share the prefix /api/v1/accounts/<account_id>/analytics. The possible   suffixes are:       * /current: includes all available courses in the default term    * /completed: includes all concluded courses in the default term    * /terms/<term_id>: includes all available or concluded courses in the      given term.      Courses not yet offered or which have been deleted are never included.      /current and /completed are intended for use when the account has only one   term. /terms/<term_id> is intended for use when the account has multiple   terms.      The action follows the suffix."

        field :get_department_level_participation_data_current,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelParticipationDataCurrent,
          description: "Get department-level participation data. Returns page view hits summed across all courses in the department. Two   groupings of these counts are returned; one by day (+by_date+), the other   by category (+by_category+). The possible categories are announcements,   assignments, collaborations, conferences, discussions, files, general,   grades, groups, modules, other, pages, and quizzes.      This and the other department-level endpoints have three variations which   all return the same style of data but for different subsets of courses. All   share the prefix /api/v1/accounts/<account_id>/analytics. The possible   suffixes are:       * /current: includes all available courses in the default term    * /completed: includes all concluded courses in the default term    * /terms/<term_id>: includes all available or concluded courses in the      given term.      Courses not yet offered or which have been deleted are never included.      /current and /completed are intended for use when the account has only one   term. /terms/<term_id> is intended for use when the account has multiple   terms.      The action follows the suffix."

        field :get_department_level_participation_data_completed,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelParticipationDataCompleted,
          description: "Get department-level participation data. Returns page view hits summed across all courses in the department. Two   groupings of these counts are returned; one by day (+by_date+), the other   by category (+by_category+). The possible categories are announcements,   assignments, collaborations, conferences, discussions, files, general,   grades, groups, modules, other, pages, and quizzes.      This and the other department-level endpoints have three variations which   all return the same style of data but for different subsets of courses. All   share the prefix /api/v1/accounts/<account_id>/analytics. The possible   suffixes are:       * /current: includes all available courses in the default term    * /completed: includes all concluded courses in the default term    * /terms/<term_id>: includes all available or concluded courses in the      given term.      Courses not yet offered or which have been deleted are never included.      /current and /completed are intended for use when the account has only one   term. /terms/<term_id> is intended for use when the account has multiple   terms.      The action follows the suffix."

        field :get_department_level_grade_data_terms,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelGradeDataTerm,
          description: "Get department-level grade data. Returns the distribution of grades for students in courses in the   department.  Each data point is one student's current grade in one course;   if a student is in multiple courses, he contributes one value per course,   but if he's enrolled multiple times in the same course (e.g. a lecture   section and a lab section), he only constributes on value for that course.      Grades are binned to the nearest integer score; anomalous grades outside   the 0 to 100 range are ignored. The raw counts are returned, not yet   normalized by the total count.      Shares the same variations on endpoint as the participation data."

        field :get_department_level_grade_data_current,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelGradeDataCurrent,
          description: "Get department-level grade data. Returns the distribution of grades for students in courses in the   department.  Each data point is one student's current grade in one course;   if a student is in multiple courses, he contributes one value per course,   but if he's enrolled multiple times in the same course (e.g. a lecture   section and a lab section), he only constributes on value for that course.      Grades are binned to the nearest integer score; anomalous grades outside   the 0 to 100 range are ignored. The raw counts are returned, not yet   normalized by the total count.      Shares the same variations on endpoint as the participation data."

        field :get_department_level_grade_data_completed,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelGradeDataCompleted,
          description: "Get department-level grade data. Returns the distribution of grades for students in courses in the   department.  Each data point is one student's current grade in one course;   if a student is in multiple courses, he contributes one value per course,   but if he's enrolled multiple times in the same course (e.g. a lecture   section and a lab section), he only constributes on value for that course.      Grades are binned to the nearest integer score; anomalous grades outside   the 0 to 100 range are ignored. The raw counts are returned, not yet   normalized by the total count.      Shares the same variations on endpoint as the participation data."

        field :get_department_level_statistics_terms,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelStatisticsTerm,
          description: "Get department-level statistics. Returns numeric statistics about the department and term (or filter).      Shares the same variations on endpoint as the participation data."

        field :get_department_level_statistics_current,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelStatisticsCurrent,
          description: "Get department-level statistics. Returns numeric statistics about the department and term (or filter).      Shares the same variations on endpoint as the participation data."

        field :get_department_level_statistics_completed,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelStatisticsCompleted,
          description: "Get department-level statistics. Returns numeric statistics about the department and term (or filter).      Shares the same variations on endpoint as the participation data."

        field :get_department_level_statistics_broken_down_by_subaccount_terms,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelStatisticsBrokenDownBySubaccountTerm,
          description: "Get department-level statistics, broken down by subaccount. Returns numeric statistics about the department subaccounts and term (or filter).      Shares the same variations on endpoint as the participation data."

        field :get_department_level_statistics_broken_down_by_subaccount_current,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelStatisticsBrokenDownBySubaccountCurrent,
          description: "Get department-level statistics, broken down by subaccount. Returns numeric statistics about the department subaccounts and term (or filter).      Shares the same variations on endpoint as the participation data."

        field :get_department_level_statistics_broken_down_by_subaccount_completed,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDepartmentLevelStatisticsBrokenDownBySubaccountCompleted,
          description: "Get department-level statistics, broken down by subaccount. Returns numeric statistics about the department subaccounts and term (or filter).      Shares the same variations on endpoint as the participation data."

        field :get_course_level_participation_data,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCourseLevelParticipationDatum,
          description: "Get course-level participation data. Returns page view hits and participation numbers grouped by day through the   entire history of the course. Page views is returned as a hash, where the   hash keys are dates in the format 'YYYY-MM-DD'. The page_views result set   includes page views broken out by access category. Participations is   returned as an array of dates in the format 'YYYY-MM-DD'."

        field :get_course_level_assignment_data,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCourseLevelAssignmentDatum,
          description: "Get course-level assignment data. Returns a list of assignments for the course sorted by due date. For   each assignment returns basic assignment information, the grade breakdown,   and a breakdown of on-time/late status of homework submissions."

        field :get_course_level_student_summary_data,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCourseLevelStudentSummaryDatum,
          description: "Get course-level student summary data. Returns a summary of per-user access information for all students in   a course. This includes total page views, total participations, and a   breakdown of on-time/late status for all homework submissions in the course.      Each student's summary also includes the maximum number of page views and   participations by any student in the course, which may be useful for some   visualizations (since determining maximums client side can be tricky with   pagination)."

        field :get_user_in_a_course_level_participation_data,
          resolver: LMSGraphQL::Resolvers::Canvas::GetUserInACourseLevelParticipationDatum,
          description: "Get user-in-a-course-level participation data. Returns page view hits grouped by hour, and participation details through the   entire history of the course.      `page_views` are returned as a hash, where the keys are iso8601 dates, bucketed by the hour.   `participations` are returned as an array of hashes, sorted oldest to newest."

        field :get_user_in_a_course_level_assignment_data,
          resolver: LMSGraphQL::Resolvers::Canvas::GetUserInACourseLevelAssignmentDatum,
          description: "Get user-in-a-course-level assignment data. Returns a list of assignments for the course sorted by due date. For   each assignment returns basic assignment information, the grade breakdown   (including the student's actual grade), and the basic submission   information for the student's submission if it exists."

        field :get_user_in_a_course_level_messaging_data,
          resolver: LMSGraphQL::Resolvers::Canvas::GetUserInACourseLevelMessagingDatum,
          description: "Get user-in-a-course-level messaging data. Returns messaging 'hits' grouped by day through the entire history of the   course. Returns a hash containing the number of instructor-to-student messages,   and student-to-instructor messages, where the hash keys are dates   in the format 'YYYY-MM-DD'. Message hits include Conversation messages and   comments on homework submissions."

        field :list_external_feeds_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListExternalFeedsCourse,
          description: "List external feeds. Returns the paginated list of External Feeds this course or group."

        field :list_external_feeds_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListExternalFeedsGroup,
          description: "List external feeds. Returns the paginated list of External Feeds this course or group."

        field :list_announcements,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAnnouncement,
          description: "List announcements. Returns the paginated list of announcements for the given courses and date range.  Note that   a +context_code+ field is added to the responses so you can tell which course each announcement   belongs to."

        field :list_scopes,
          resolver: LMSGraphQL::Resolvers::Canvas::ListScope,
          description: "List scopes. A list of scopes that can be applied to developer keys and access tokens."

        field :list_appointment_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAppointmentGroup,
          description: "List appointment groups. Retrieve the paginated list of appointment groups that can be reserved or   managed by the current user."

        field :get_single_appointment_group,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleAppointmentGroup,
          description: "Get a single appointment group. Returns information for a single appointment group"

        field :list_user_participants,
          resolver: LMSGraphQL::Resolvers::Canvas::ListUserParticipant,
          description: "List user participants. A paginated list of users that are (or may be) participating in this   appointment group.  Refer to the Users API for the response fields. Returns   no results for appointment groups with the 'Group' participant_type."

        field :list_student_group_participants,
          resolver: LMSGraphQL::Resolvers::Canvas::ListStudentGroupParticipant,
          description: "List student group participants. A paginated list of student groups that are (or may be) participating in   this appointment group. Refer to the Groups API for the response fields.   Returns no results for appointment groups with the 'User' participant_type."

        field :get_next_appointment,
          resolver: LMSGraphQL::Resolvers::Canvas::GetNextAppointment,
          description: "Get next appointment. Return the next appointment available to sign up for. The appointment   is returned in a one-element array. If no future appointments are   available, an empty array is returned."

        field :list_assignment_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAssignmentGroup,
          description: "List assignment groups. Returns the paginated list of assignment groups for the current context.   The returned groups are sorted by their position field."

        field :get_assignment_group,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAssignmentGroup,
          description: "Get an Assignment Group. Returns the assignment group with the given id."

        field :list_assignments_assignments,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAssignmentsAssignment,
          description: "List assignments. Returns the paginated list of assignments for the current course or assignment group."

        field :list_assignments_assignment_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAssignmentsAssignmentGroup,
          description: "List assignments. Returns the paginated list of assignments for the current course or assignment group."

        field :list_assignments_for_user,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAssignmentsForUser,
          description: "List assignments for user. Returns the paginated list of assignments for the specified user if the current user has rights to view.   See {api:AssignmentsApiController#index List assignments} for valid arguments."

        field :get_single_assignment,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleAssignment,
          description: "Get a single assignment. Returns the assignment with the given id."

        field :list_assignment_overrides,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAssignmentOverride,
          description: "List assignment overrides. Returns the paginated list of overrides for this assignment that target   sections/groups/students visible to the current user."

        field :get_single_assignment_override,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleAssignmentOverride,
          description: "Get a single assignment override. Returns details of the the override with the given id."

        field :redirect_to_assignment_override_for_group,
          resolver: LMSGraphQL::Resolvers::Canvas::RedirectToAssignmentOverrideForGroup,
          description: "Redirect to the assignment override for a group. Responds with a redirect to the override for the given group, if any   (404 otherwise)."

        field :redirect_to_assignment_override_for_section,
          resolver: LMSGraphQL::Resolvers::Canvas::RedirectToAssignmentOverrideForSection,
          description: "Redirect to the assignment override for a section. Responds with a redirect to the override for the given section, if any   (404 otherwise)."

        field :batch_retrieve_overrides_in_course,
          resolver: LMSGraphQL::Resolvers::Canvas::BatchRetrieveOverridesInCourse,
          description: "Batch retrieve overrides in a course. Returns a list of specified overrides in this course, providing   they target sections/groups/students visible to the current user.   Returns null elements in the list for requests that were not found."

        field :list_authentication_providers,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAuthenticationProvider,
          description: "List authentication providers. Returns a paginated list of authentication providers"

        field :get_authentication_provider,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAuthenticationProvider,
          description: "Get authentication provider. Get the specified authentication provider"

        field :show_account_auth_settings,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowAccountAuthSetting,
          description: "show account auth settings. The way to get the current state of each account level setting   that's relevant to Single Sign On configuration      You can list the current state of each setting with 'update_sso_settings'"

        field :query_by_login,
          resolver: LMSGraphQL::Resolvers::Canvas::QueryByLogin,
          description: "Query by login.. List authentication events for a given login."

        field :query_by_account,
          resolver: LMSGraphQL::Resolvers::Canvas::QueryByAccount,
          description: "Query by account.. List authentication events for a given account."

        field :query_by_user,
          resolver: LMSGraphQL::Resolvers::Canvas::QueryByUser,
          description: "Query by user.. List authentication events for a given user."

        field :list_blackout_dates_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListBlackoutDatesCourse,
          description: "List blackout dates. Returns the list of blackout dates for the current context."

        field :list_blackout_dates_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListBlackoutDatesAccount,
          description: "List blackout dates. Returns the list of blackout dates for the current context."

        field :get_single_blackout_date_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleBlackoutDateCourse,
          description: "Get a single blackout date. Returns the blackout date with the given id."

        field :get_single_blackout_date_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleBlackoutDateAccount,
          description: "Get a single blackout date. Returns the blackout date with the given id."

        field :new_blackout_date_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::NewBlackoutDateCourse,
          description: "New Blackout Date. Initialize an unsaved Blackout Date for the given context."

        field :new_blackout_date_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::NewBlackoutDateAccount,
          description: "New Blackout Date. Initialize an unsaved Blackout Date for the given context."

        field :get_blueprint_information,
          resolver: LMSGraphQL::Resolvers::Canvas::GetBlueprintInformation,
          description: "Get blueprint information. Using 'default' as the template_id should suffice for the current implmentation (as there should be only one template per course).   However, using specific template ids may become necessary in the future"

        field :get_associated_course_information,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAssociatedCourseInformation,
          description: "Get associated course information. Returns a list of courses that are configured to receive updates from this blueprint"

        field :get_unsynced_changes,
          resolver: LMSGraphQL::Resolvers::Canvas::GetUnsyncedChange,
          description: "Get unsynced changes. Retrieve a list of learning objects that have changed since the last blueprint sync operation.   If no syncs have been completed, a ChangeRecord with a change_type of +initial_sync+ is returned."

        field :list_blueprint_migrations,
          resolver: LMSGraphQL::Resolvers::Canvas::ListBlueprintMigration,
          description: "List blueprint migrations. Shows a paginated list of migrations for the template, starting with the most recent. This endpoint can be called on a   blueprint course. See also {api:MasterCourses::MasterTemplatesController#imports_index the associated course side}."

        field :show_blueprint_migration,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowBlueprintMigration,
          description: "Show a blueprint migration. Shows the status of a migration. This endpoint can be called on a blueprint course. See also   {api:MasterCourses::MasterTemplatesController#imports_show the associated course side}."

        field :get_migration_details,
          resolver: LMSGraphQL::Resolvers::Canvas::GetMigrationDetail,
          description: "Get migration details. Show the changes that were propagated in a blueprint migration. This endpoint can be called on a   blueprint course. See also {api:MasterCourses::MasterTemplatesController#import_details the associated course side}."

        field :list_blueprint_subscriptions,
          resolver: LMSGraphQL::Resolvers::Canvas::ListBlueprintSubscription,
          description: "List blueprint subscriptions. Returns a list of blueprint subscriptions for the given course. (Currently a course may have no more than one.)"

        field :list_blueprint_imports,
          resolver: LMSGraphQL::Resolvers::Canvas::ListBlueprintImport,
          description: "List blueprint imports. Shows a paginated list of migrations imported into a course associated with a blueprint, starting with the most recent. See also   {api:MasterCourses::MasterTemplatesController#migrations_index the blueprint course side}.      Use 'default' as the subscription_id to use the currently active blueprint subscription."

        field :show_blueprint_import,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowBlueprintImport,
          description: "Show a blueprint import. Shows the status of an import into a course associated with a blueprint. See also   {api:MasterCourses::MasterTemplatesController#migrations_show the blueprint course side}."

        field :get_import_details,
          resolver: LMSGraphQL::Resolvers::Canvas::GetImportDetail,
          description: "Get import details. Show the changes that were propagated to a course associated with a blueprint.  See also   {api:MasterCourses::MasterTemplatesController#migration_details the blueprint course side}."

        field :list_bookmarks,
          resolver: LMSGraphQL::Resolvers::Canvas::ListBookmark,
          description: "List bookmarks. Returns the paginated list of bookmarks."

        field :get_bookmark,
          resolver: LMSGraphQL::Resolvers::Canvas::GetBookmark,
          description: "Get bookmark. Returns the details for a bookmark."

        field :get_brand_config_variables_that_should_be_used_for_this_domain,
          resolver: LMSGraphQL::Resolvers::Canvas::GetBrandConfigVariablesThatShouldBeUsedForThisDomain,
          description: "Get the brand config variables that should be used for this domain. Will redirect to a static json file that has all of the brand   variables used by this account. Even though this is a redirect,   do not store the redirected url since if the account makes any changes   it will redirect to a new url. Needs no authentication."

        field :list_calendar_events,
          resolver: LMSGraphQL::Resolvers::Canvas::ListCalendarEvent,
          description: "List calendar events. Retrieve the paginated list of calendar events or assignments for the current user"

        field :list_calendar_events_for_user,
          resolver: LMSGraphQL::Resolvers::Canvas::ListCalendarEventsForUser,
          description: "List calendar events for a user. Retrieve the paginated list of calendar events or assignments for the specified user.   To view calendar events for a user other than yourself,   you must either be an observer of that user or an administrator."

        field :get_single_calendar_event_or_assignment,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleCalendarEventOrAssignment,
          description: "Get a single calendar event or assignment. "

        field :get_course_timetable,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCourseTimetable,
          description: "Get course timetable. Returns the last timetable set by the   {api:CalendarEventsApiController#set_course_timetable Set a course timetable} endpoint"

        field :list_collaborations_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListCollaborationsCourse,
          description: "List collaborations. A paginated list of collaborations the current user has access to in the   context of the course provided in the url. NOTE: this only returns   ExternalToolCollaboration type collaborations.        curl https: <canvas>/api/v1/courses/1/collaborations/"

        field :list_collaborations_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListCollaborationsGroup,
          description: "List collaborations. A paginated list of collaborations the current user has access to in the   context of the course provided in the url. NOTE: this only returns   ExternalToolCollaboration type collaborations.        curl https: <canvas>/api/v1/courses/1/collaborations/"

        field :list_members_of_collaboration,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMembersOfCollaboration,
          description: "List members of a collaboration.. A paginated list of the collaborators of a given collaboration"

        field :list_potential_members_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPotentialMembersCourse,
          description: "List potential members. A paginated list of the users who can potentially be added to a   collaboration in the given context.      For courses, this consists of all enrolled users.  For groups, it is comprised of the   group members plus the admins of the course containing the group."

        field :list_potential_members_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPotentialMembersGroup,
          description: "List potential members. A paginated list of the users who can potentially be added to a   collaboration in the given context.      For courses, this consists of all enrolled users.  For groups, it is comprised of the   group members plus the admins of the course containing the group."

        field :list_of_commmessages_for_user,
          resolver: LMSGraphQL::Resolvers::Canvas::ListOfCommmessagesForUser,
          description: "List of CommMessages for a user. Retrieve a paginated list of messages sent to a user."

        field :list_user_communication_channels,
          resolver: LMSGraphQL::Resolvers::Canvas::ListUserCommunicationChannel,
          description: "List user communication channels. Returns a paginated list of communication channels for the specified user,   sorted by position."

        field :list_conferences_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListConferencesCourse,
          description: "List conferences. Retrieve the paginated list of conferences for this context      This API returns a JSON object containing the list of conferences,   the key for the list of conferences is 'conferences'"

        field :list_conferences_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListConferencesGroup,
          description: "List conferences. Retrieve the paginated list of conferences for this context      This API returns a JSON object containing the list of conferences,   the key for the list of conferences is 'conferences'"

        field :list_conferences_for_current_user,
          resolver: LMSGraphQL::Resolvers::Canvas::ListConferencesForCurrentUser,
          description: "List conferences for the current user. Retrieve the paginated list of conferences for all courses and groups   the current user belongs to      This API returns a JSON object containing the list of conferences.   The key for the list of conferences is 'conferences'."

        field :list_content_exports_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListContentExportsCourse,
          description: "List content exports. A paginated list of the past and pending content export jobs for a course,   group, or user. Exports are returned newest first."

        field :list_content_exports_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListContentExportsGroup,
          description: "List content exports. A paginated list of the past and pending content export jobs for a course,   group, or user. Exports are returned newest first."

        field :list_content_exports_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListContentExportsUser,
          description: "List content exports. A paginated list of the past and pending content export jobs for a course,   group, or user. Exports are returned newest first."

        field :show_content_export_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowContentExportCourse,
          description: "Show content export. Get information about a single content export."

        field :show_content_export_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowContentExportGroup,
          description: "Show content export. Get information about a single content export."

        field :show_content_export_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowContentExportUser,
          description: "Show content export. Get information about a single content export."

        field :list_migration_issues_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMigrationIssuesAccount,
          description: "List migration issues. Returns paginated migration issues"

        field :list_migration_issues_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMigrationIssuesCourse,
          description: "List migration issues. Returns paginated migration issues"

        field :list_migration_issues_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMigrationIssuesGroup,
          description: "List migration issues. Returns paginated migration issues"

        field :list_migration_issues_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMigrationIssuesUser,
          description: "List migration issues. Returns paginated migration issues"

        field :get_migration_issue_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetMigrationIssueAccount,
          description: "Get a migration issue. Returns data on an individual migration issue"

        field :get_migration_issue_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetMigrationIssueCourse,
          description: "Get a migration issue. Returns data on an individual migration issue"

        field :get_migration_issue_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::GetMigrationIssueGroup,
          description: "Get a migration issue. Returns data on an individual migration issue"

        field :get_migration_issue_users,
          resolver: LMSGraphQL::Resolvers::Canvas::GetMigrationIssueUser,
          description: "Get a migration issue. Returns data on an individual migration issue"

        field :list_content_migrations_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListContentMigrationsAccount,
          description: "List content migrations. Returns paginated content migrations"

        field :list_content_migrations_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListContentMigrationsCourse,
          description: "List content migrations. Returns paginated content migrations"

        field :list_content_migrations_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListContentMigrationsGroup,
          description: "List content migrations. Returns paginated content migrations"

        field :list_content_migrations_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListContentMigrationsUser,
          description: "List content migrations. Returns paginated content migrations"

        field :get_content_migration_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetContentMigrationAccount,
          description: "Get a content migration. Returns data on an individual content migration"

        field :get_content_migration_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetContentMigrationCourse,
          description: "Get a content migration. Returns data on an individual content migration"

        field :get_content_migration_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::GetContentMigrationGroup,
          description: "Get a content migration. Returns data on an individual content migration"

        field :get_content_migration_users,
          resolver: LMSGraphQL::Resolvers::Canvas::GetContentMigrationUser,
          description: "Get a content migration. Returns data on an individual content migration"

        field :list_migration_systems_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMigrationSystemsAccount,
          description: "List Migration Systems. Lists the currently available migration types. These values may change."

        field :list_migration_systems_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMigrationSystemsCourse,
          description: "List Migration Systems. Lists the currently available migration types. These values may change."

        field :list_migration_systems_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMigrationSystemsGroup,
          description: "List Migration Systems. Lists the currently available migration types. These values may change."

        field :list_migration_systems_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMigrationSystemsUser,
          description: "List Migration Systems. Lists the currently available migration types. These values may change."

        field :list_items_for_selective_import_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListItemsForSelectiveImportAccount,
          description: "List items for selective import. Enumerates the content available for selective import in a tree structure. Each node provides   a +property+ copy argument that can be supplied to the {api:ContentMigrationsController#update Update endpoint}   to selectively copy the content associated with that tree node and its children. Each node may also   provide a +sub_items_url+ or an array of +sub_items+ which you can use to obtain copy parameters   for a subset of the resources in a given node.      If no +type+ is sent you will get a list of the top-level sections in the content. It will look something like this:        [{       'type': 'course_settings',       'property': 'copy[all_course_settings]',       'title': 'Course Settings'     },     {       'type': 'context_modules',       'property': 'copy[all_context_modules]',       'title': 'Modules',       'count': 5,       'sub_items_url': 'http: example.com/api/v1/courses/22/content_migrations/77/selective_data?type=context_modules'     },     {       'type': 'assignments',       'property': 'copy[all_assignments]',       'title': 'Assignments',       'count': 2,       'sub_items_url': 'http: localhost:3000/api/v1/courses/22/content_migrations/77/selective_data?type=assignments'     }]      When a +type+ is provided, nodes may be further divided via +sub_items+. For example, using +type=assignments+   results in a node for each assignment group and a sub_item for each assignment, like this:        [{       'type': 'assignment_groups',       'title': 'An Assignment Group',       'property': 'copy[assignment_groups][id_i855cf145e5acc7435e1bf1c6e2126e5f]',       'sub_items': [{           'type': 'assignments',           'title': 'Assignment 1',           'property': 'copy[assignments][id_i2102a7fa93b29226774949298626719d]'       }, {           'type': 'assignments',           'title': 'Assignment 2',           'property': 'copy[assignments][id_i310cba275dc3f4aa8a3306bbbe380979]'       }]     }]         To import the items corresponding to a particular tree node, use the +property+ as a parameter to the   {api:ContentMigrationsController#update Update endpoint} and assign a value of 1, for example:        copy[assignments][id_i310cba275dc3f4aa8a3306bbbe380979]=1      You can include multiple copy parameters to selectively import multiple items or groups of items."

        field :list_items_for_selective_import_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListItemsForSelectiveImportCourse,
          description: "List items for selective import. Enumerates the content available for selective import in a tree structure. Each node provides   a +property+ copy argument that can be supplied to the {api:ContentMigrationsController#update Update endpoint}   to selectively copy the content associated with that tree node and its children. Each node may also   provide a +sub_items_url+ or an array of +sub_items+ which you can use to obtain copy parameters   for a subset of the resources in a given node.      If no +type+ is sent you will get a list of the top-level sections in the content. It will look something like this:        [{       'type': 'course_settings',       'property': 'copy[all_course_settings]',       'title': 'Course Settings'     },     {       'type': 'context_modules',       'property': 'copy[all_context_modules]',       'title': 'Modules',       'count': 5,       'sub_items_url': 'http: example.com/api/v1/courses/22/content_migrations/77/selective_data?type=context_modules'     },     {       'type': 'assignments',       'property': 'copy[all_assignments]',       'title': 'Assignments',       'count': 2,       'sub_items_url': 'http: localhost:3000/api/v1/courses/22/content_migrations/77/selective_data?type=assignments'     }]      When a +type+ is provided, nodes may be further divided via +sub_items+. For example, using +type=assignments+   results in a node for each assignment group and a sub_item for each assignment, like this:        [{       'type': 'assignment_groups',       'title': 'An Assignment Group',       'property': 'copy[assignment_groups][id_i855cf145e5acc7435e1bf1c6e2126e5f]',       'sub_items': [{           'type': 'assignments',           'title': 'Assignment 1',           'property': 'copy[assignments][id_i2102a7fa93b29226774949298626719d]'       }, {           'type': 'assignments',           'title': 'Assignment 2',           'property': 'copy[assignments][id_i310cba275dc3f4aa8a3306bbbe380979]'       }]     }]         To import the items corresponding to a particular tree node, use the +property+ as a parameter to the   {api:ContentMigrationsController#update Update endpoint} and assign a value of 1, for example:        copy[assignments][id_i310cba275dc3f4aa8a3306bbbe380979]=1      You can include multiple copy parameters to selectively import multiple items or groups of items."

        field :list_items_for_selective_import_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListItemsForSelectiveImportGroup,
          description: "List items for selective import. Enumerates the content available for selective import in a tree structure. Each node provides   a +property+ copy argument that can be supplied to the {api:ContentMigrationsController#update Update endpoint}   to selectively copy the content associated with that tree node and its children. Each node may also   provide a +sub_items_url+ or an array of +sub_items+ which you can use to obtain copy parameters   for a subset of the resources in a given node.      If no +type+ is sent you will get a list of the top-level sections in the content. It will look something like this:        [{       'type': 'course_settings',       'property': 'copy[all_course_settings]',       'title': 'Course Settings'     },     {       'type': 'context_modules',       'property': 'copy[all_context_modules]',       'title': 'Modules',       'count': 5,       'sub_items_url': 'http: example.com/api/v1/courses/22/content_migrations/77/selective_data?type=context_modules'     },     {       'type': 'assignments',       'property': 'copy[all_assignments]',       'title': 'Assignments',       'count': 2,       'sub_items_url': 'http: localhost:3000/api/v1/courses/22/content_migrations/77/selective_data?type=assignments'     }]      When a +type+ is provided, nodes may be further divided via +sub_items+. For example, using +type=assignments+   results in a node for each assignment group and a sub_item for each assignment, like this:        [{       'type': 'assignment_groups',       'title': 'An Assignment Group',       'property': 'copy[assignment_groups][id_i855cf145e5acc7435e1bf1c6e2126e5f]',       'sub_items': [{           'type': 'assignments',           'title': 'Assignment 1',           'property': 'copy[assignments][id_i2102a7fa93b29226774949298626719d]'       }, {           'type': 'assignments',           'title': 'Assignment 2',           'property': 'copy[assignments][id_i310cba275dc3f4aa8a3306bbbe380979]'       }]     }]         To import the items corresponding to a particular tree node, use the +property+ as a parameter to the   {api:ContentMigrationsController#update Update endpoint} and assign a value of 1, for example:        copy[assignments][id_i310cba275dc3f4aa8a3306bbbe380979]=1      You can include multiple copy parameters to selectively import multiple items or groups of items."

        field :list_items_for_selective_import_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListItemsForSelectiveImportUser,
          description: "List items for selective import. Enumerates the content available for selective import in a tree structure. Each node provides   a +property+ copy argument that can be supplied to the {api:ContentMigrationsController#update Update endpoint}   to selectively copy the content associated with that tree node and its children. Each node may also   provide a +sub_items_url+ or an array of +sub_items+ which you can use to obtain copy parameters   for a subset of the resources in a given node.      If no +type+ is sent you will get a list of the top-level sections in the content. It will look something like this:        [{       'type': 'course_settings',       'property': 'copy[all_course_settings]',       'title': 'Course Settings'     },     {       'type': 'context_modules',       'property': 'copy[all_context_modules]',       'title': 'Modules',       'count': 5,       'sub_items_url': 'http: example.com/api/v1/courses/22/content_migrations/77/selective_data?type=context_modules'     },     {       'type': 'assignments',       'property': 'copy[all_assignments]',       'title': 'Assignments',       'count': 2,       'sub_items_url': 'http: localhost:3000/api/v1/courses/22/content_migrations/77/selective_data?type=assignments'     }]      When a +type+ is provided, nodes may be further divided via +sub_items+. For example, using +type=assignments+   results in a node for each assignment group and a sub_item for each assignment, like this:        [{       'type': 'assignment_groups',       'title': 'An Assignment Group',       'property': 'copy[assignment_groups][id_i855cf145e5acc7435e1bf1c6e2126e5f]',       'sub_items': [{           'type': 'assignments',           'title': 'Assignment 1',           'property': 'copy[assignments][id_i2102a7fa93b29226774949298626719d]'       }, {           'type': 'assignments',           'title': 'Assignment 2',           'property': 'copy[assignments][id_i310cba275dc3f4aa8a3306bbbe380979]'       }]     }]         To import the items corresponding to a particular tree node, use the +property+ as a parameter to the   {api:ContentMigrationsController#update Update endpoint} and assign a value of 1, for example:        copy[assignments][id_i310cba275dc3f4aa8a3306bbbe380979]=1      You can include multiple copy parameters to selectively import multiple items or groups of items."

        field :get_current_settings_for_account_or_course_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCurrentSettingsForAccountOrCourseCourse,
          description: "Get current settings for account or course. Update multiple modules in an account."

        field :get_current_settings_for_account_or_course_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCurrentSettingsForAccountOrCourseAccount,
          description: "Get current settings for account or course. Update multiple modules in an account."

        field :retrieve_reported_csp_violations_for_account,
          resolver: LMSGraphQL::Resolvers::Canvas::RetrieveReportedCspViolationsForAccount,
          description: "Retrieve reported CSP Violations for account. Must be called on a root account."

        field :list_content_shares_sent,
          resolver: LMSGraphQL::Resolvers::Canvas::ListContentSharesSent,
          description: "List content shares. Return a paginated list of content shares a user has sent or received. Use +self+ as the user_id   to retrieve your own content shares. Only linked observers and administrators may view other users'   content shares."

        field :list_content_shares_received,
          resolver: LMSGraphQL::Resolvers::Canvas::ListContentSharesReceived,
          description: "List content shares. Return a paginated list of content shares a user has sent or received. Use +self+ as the user_id   to retrieve your own content shares. Only linked observers and administrators may view other users'   content shares."

        field :get_unread_shares_count,
          resolver: LMSGraphQL::Resolvers::Canvas::GetUnreadSharesCount,
          description: "Get unread shares count. Return the number of content shares a user has received that have not yet been read. Use +self+ as the user_id   to retrieve your own content shares. Only linked observers and administrators may view other users'   content shares."

        field :get_content_share,
          resolver: LMSGraphQL::Resolvers::Canvas::GetContentShare,
          description: "Get content share. Return information about a single content share. You may use +self+ as the user_id to retrieve your own content share."

        field :list_conversations,
          resolver: LMSGraphQL::Resolvers::Canvas::ListConversation,
          description: "List conversations. Returns the paginated list of conversations for the current user, most   recent ones first."

        field :get_running_batches,
          resolver: LMSGraphQL::Resolvers::Canvas::GetRunningBatch,
          description: "Get running batches. Returns any currently running conversation batches for the current user.   Conversation batches are created when a bulk private message is sent   asynchronously (see the mode argument to the {api:ConversationsController#create create API action})."

        field :get_single_conversation,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleConversation,
          description: "Get a single conversation. Returns information for a single conversation for the current user. Response includes all   fields that are present in the list/index action as well as messages   and extended participant information."

        field :find_recipients,
          resolver: LMSGraphQL::Resolvers::Canvas::FindRecipient,
          description: "Find recipients. Deprecated, see the {api:SearchController#recipients Find recipients endpoint} in the Search API"

        field :unread_count,
          resolver: LMSGraphQL::Resolvers::Canvas::UnreadCount,
          description: "Unread count. Get the number of unread conversations for the current user"

        field :course_audit_log_query_by_course,
          resolver: LMSGraphQL::Resolvers::Canvas::CourseAuditLogQueryByCourse,
          description: "Query by course.. List course change events for a given course."

        field :course_audit_log_query_by_account,
          resolver: LMSGraphQL::Resolvers::Canvas::CourseAuditLogQueryByAccount,
          description: "Query by account.. List course change events for a given account."

        field :list_your_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListYourCourse,
          description: "List your courses. Returns the paginated list of active courses for the current user."

        field :list_courses_for_user,
          resolver: LMSGraphQL::Resolvers::Canvas::ListCoursesForUser,
          description: "List courses for a user. Returns a paginated list of active courses for this user. To view the course list for a user other than yourself, you must be either an observer of that user or an administrator."

        field :get_user_progress,
          resolver: LMSGraphQL::Resolvers::Canvas::GetUserProgress,
          description: "Get user progress. Return progress information for the user and course      You can supply +self+ as the user_id to query your own progress in a course. To query another user's progress,   you must be a teacher in the course, an administrator, or a linked observer of the user."

        field :list_students,
          resolver: LMSGraphQL::Resolvers::Canvas::ListStudent,
          description: "List students. Returns the paginated list of students enrolled in this course.      DEPRECATED: Please use the {api:CoursesController#users course users} endpoint   and pass 'student' as the enrollment_type."

        field :list_users_in_course_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListUsersInCourseUser,
          description: "List users in course. Returns the paginated list of users in this course. And optionally the user's enrollments in the course."

        field :list_users_in_course_search_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListUsersInCourseSearchUser,
          description: "List users in course. Returns the paginated list of users in this course. And optionally the user's enrollments in the course."

        field :list_recently_logged_in_students,
          resolver: LMSGraphQL::Resolvers::Canvas::ListRecentlyLoggedInStudent,
          description: "List recently logged in students. Returns the paginated list of users in this course, ordered by how recently they have   logged in. The records include the 'last_login' field which contains   a timestamp of the last time that user logged into canvas.  The querying   user must have the 'View usage reports' permission."

        field :get_single_user,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleUser,
          description: "Get single user. Return information on a single user.      Accepts the same include[] parameters as the :users: action, and returns a   single user with the same fields as that action."

        field :search_for_content_share_users,
          resolver: LMSGraphQL::Resolvers::Canvas::SearchForContentShareUser,
          description: "Search for content share users. Returns a paginated list of users you can share content with.  Requires the content share   feature and the user must have the manage content permission for the course."

        field :course_activity_stream,
          resolver: LMSGraphQL::Resolvers::Canvas::CourseActivityStream,
          description: "Course activity stream. Returns the current user's course-specific activity stream, paginated.      For full documentation, see the API documentation for the user activity   stream, in the user api."

        field :course_activity_stream_summary,
          resolver: LMSGraphQL::Resolvers::Canvas::CourseActivityStreamSummary,
          description: "Course activity stream summary. Returns a summary of the current user's course-specific activity stream.      For full documentation, see the API documentation for the user activity   stream summary, in the user api."

        field :course_todo_items,
          resolver: LMSGraphQL::Resolvers::Canvas::CourseTodoItem,
          description: "Course TODO items. Returns the current user's course-specific todo items.      For full documentation, see the API documentation for the user todo items, in the user api."

        field :get_course_settings,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCourseSetting,
          description: "Get course settings. Returns some of a course's settings."

        field :return_test_student_for_course,
          resolver: LMSGraphQL::Resolvers::Canvas::ReturnTestStudentForCourse,
          description: "Return test student for course. Returns information for a test student in this course. Creates a test   student if one does not already exist for the course. The caller must have   permission to access the course's student view."

        field :get_single_course_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleCourseCourse,
          description: "Get a single course. Return information on a single course.      Accepts the same include[] parameters as the list action plus:"

        field :get_single_course_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleCourseAccount,
          description: "Get a single course. Return information on a single course.      Accepts the same include[] parameters as the list action plus:"

        field :get_effective_due_dates,
          resolver: LMSGraphQL::Resolvers::Canvas::GetEffectiveDueDate,
          description: "Get effective due dates. For each assignment in the course, returns each assigned student's ID   and their corresponding due date along with some grading period data.   Returns a collection with keys representing assignment IDs and values as a   collection containing keys representing student IDs and values representing   the student's effective due_at, the grading_period_id of which the due_at falls   in, and whether or not the grading period is closed (in_closed_grading_period)      The list of assignment IDs for which effective student due dates are   requested. If not provided, all assignments in the course will be used."

        field :courses_permissions,
          resolver: LMSGraphQL::Resolvers::Canvas::CoursesPermission,
          description: "Permissions. Returns permission information for the calling user in the given course.   See also the {api:AccountsController#permissions Account} and   {api:GroupsController#permissions Group} counterparts."

        field :get_bulk_user_progress,
          resolver: LMSGraphQL::Resolvers::Canvas::GetBulkUserProgress,
          description: "Get bulk user progress. Returns progress information for all users enrolled in the given course.      You must be a user who has permission to view all grades in the course (such as a teacher or administrator)."

        field :get_course_copy_status,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCourseCopyStatus,
          description: "Get course copy status. DEPRECATED: Please use the {api:ContentMigrationsController#create Content Migrations API}      Retrieve the status of a course copy"

        field :list_custom_gradebook_columns,
          resolver: LMSGraphQL::Resolvers::Canvas::ListCustomGradebookColumn,
          description: "List custom gradebook columns. A paginated list of all custom gradebook columns for a course"

        field :list_entries_for_column,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEntriesForColumn,
          description: "List entries for a column. This does not list entries for students without associated data."

        field :list_discussion_topics_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListDiscussionTopicsCourse,
          description: "List discussion topics. Returns the paginated list of discussion topics for this course or group."

        field :list_discussion_topics_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListDiscussionTopicsGroup,
          description: "List discussion topics. Returns the paginated list of discussion topics for this course or group."

        field :get_single_topic_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleTopicCourse,
          description: "Get a single topic. Returns data on an individual discussion topic. See the List action for the response formatting."

        field :get_single_topic_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleTopicGroup,
          description: "Get a single topic. Returns data on an individual discussion topic. See the List action for the response formatting."

        field :get_full_topic_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFullTopicCourse,
          description: "Get the full topic. Return a cached structure of the discussion topic, containing all entries,   their authors, and their message bodies.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      In some rare situations, this cached structure may not be available yet. In   that case, the server will respond with a 503 error, and the caller should   try again soon.      The response is an object containing the following keys:   * 'participants': A list of summary information on users who have posted to     the discussion. Each value is an object containing their id, display_name,     and avatar_url.   * 'unread_entries': A list of entry ids that are unread by the current     user. this implies that any entry not in this list is read.   * 'entry_ratings': A map of entry ids to ratings by the current user. Entries     not in this list have no rating. Only populated if rating is enabled.   * 'forced_entries': A list of entry ids that have forced_read_state set to     true. This flag is meant to indicate the entry's read_state has been     manually set to 'unread' by the user, so the entry should not be     automatically marked as read.   * 'view': A threaded view of all the entries in the discussion, containing     the id, user_id, and message.   * 'new_entries': Because this view is eventually consistent, it's possible     that newly created or updated entries won't yet be reflected in the view.     If the application wants to also get a flat list of all entries not yet     reflected in the view, pass include_new_entries=1 to the request and this     array of entries will be returned. These entries are returned in a flat     array, in ascending created_at order."

        field :get_full_topic_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFullTopicGroup,
          description: "Get the full topic. Return a cached structure of the discussion topic, containing all entries,   their authors, and their message bodies.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      In some rare situations, this cached structure may not be available yet. In   that case, the server will respond with a 503 error, and the caller should   try again soon.      The response is an object containing the following keys:   * 'participants': A list of summary information on users who have posted to     the discussion. Each value is an object containing their id, display_name,     and avatar_url.   * 'unread_entries': A list of entry ids that are unread by the current     user. this implies that any entry not in this list is read.   * 'entry_ratings': A map of entry ids to ratings by the current user. Entries     not in this list have no rating. Only populated if rating is enabled.   * 'forced_entries': A list of entry ids that have forced_read_state set to     true. This flag is meant to indicate the entry's read_state has been     manually set to 'unread' by the user, so the entry should not be     automatically marked as read.   * 'view': A threaded view of all the entries in the discussion, containing     the id, user_id, and message.   * 'new_entries': Because this view is eventually consistent, it's possible     that newly created or updated entries won't yet be reflected in the view.     If the application wants to also get a flat list of all entries not yet     reflected in the view, pass include_new_entries=1 to the request and this     array of entries will be returned. These entries are returned in a flat     array, in ascending created_at order."

        field :list_topic_entries_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListTopicEntriesCourse,
          description: "List topic entries. Retrieve the (paginated) top-level entries in a discussion topic.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      Will include the 10 most recent replies, if any, for each entry returned.      If the topic is a root topic with children corresponding to groups of a   group assignment, entries from those subtopics for which the user belongs   to the corresponding group will be returned.      Ordering of returned entries is newest-first by posting timestamp (reply   activity is ignored)."

        field :list_topic_entries_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListTopicEntriesGroup,
          description: "List topic entries. Retrieve the (paginated) top-level entries in a discussion topic.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      Will include the 10 most recent replies, if any, for each entry returned.      If the topic is a root topic with children corresponding to groups of a   group assignment, entries from those subtopics for which the user belongs   to the corresponding group will be returned.      Ordering of returned entries is newest-first by posting timestamp (reply   activity is ignored)."

        field :list_entry_replies_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEntryRepliesCourse,
          description: "List entry replies. Retrieve the (paginated) replies to a top-level entry in a discussion   topic.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      Ordering of returned entries is newest-first by creation timestamp."

        field :list_entry_replies_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEntryRepliesGroup,
          description: "List entry replies. Retrieve the (paginated) replies to a top-level entry in a discussion   topic.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      Ordering of returned entries is newest-first by creation timestamp."

        field :list_entries_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEntriesCourse,
          description: "List entries. Retrieve a paginated list of discussion entries, given a list of ids.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'."

        field :list_entries_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEntriesGroup,
          description: "List entries. Retrieve a paginated list of discussion entries, given a list of ids.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'."

        field :list_enrollment_terms,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEnrollmentTerm,
          description: "List enrollment terms. An object with a paginated list of all of the terms in the account."

        field :retrieve_enrollment_term,
          resolver: LMSGraphQL::Resolvers::Canvas::RetrieveEnrollmentTerm,
          description: "Retrieve enrollment term. Retrieves the details for an enrollment term in the account. Includes overrides by default."

        field :list_enrollments_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEnrollmentsCourse,
          description: "List enrollments. Depending on the URL given, return a paginated list of either (1) all of   the enrollments in a course, (2) all of the enrollments in a section or (3)   all of a user's enrollments. This includes student, teacher, TA, and   observer enrollments.      If a user has multiple enrollments in a context (e.g. as a teacher   and a student or in multiple course sections), each enrollment will be   listed separately.      note: Currently, only a root level admin user can return other users' enrollments.   A user can, however, return his/her own enrollments.      Enrollments scoped to a course context will include inactive states by default   if the caller has account admin authorization and the state[] parameter is omitted."

        field :list_enrollments_sections,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEnrollmentsSection,
          description: "List enrollments. Depending on the URL given, return a paginated list of either (1) all of   the enrollments in a course, (2) all of the enrollments in a section or (3)   all of a user's enrollments. This includes student, teacher, TA, and   observer enrollments.      If a user has multiple enrollments in a context (e.g. as a teacher   and a student or in multiple course sections), each enrollment will be   listed separately.      note: Currently, only a root level admin user can return other users' enrollments.   A user can, however, return his/her own enrollments.      Enrollments scoped to a course context will include inactive states by default   if the caller has account admin authorization and the state[] parameter is omitted."

        field :list_enrollments_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEnrollmentsUser,
          description: "List enrollments. Depending on the URL given, return a paginated list of either (1) all of   the enrollments in a course, (2) all of the enrollments in a section or (3)   all of a user's enrollments. This includes student, teacher, TA, and   observer enrollments.      If a user has multiple enrollments in a context (e.g. as a teacher   and a student or in multiple course sections), each enrollment will be   listed separately.      note: Currently, only a root level admin user can return other users' enrollments.   A user can, however, return his/her own enrollments.      Enrollments scoped to a course context will include inactive states by default   if the caller has account admin authorization and the state[] parameter is omitted."

        field :enrollment_by_id,
          resolver: LMSGraphQL::Resolvers::Canvas::EnrollmentById,
          description: "Enrollment by ID. Get an Enrollment object by Enrollment ID"

        field :get_all_eportfolios_for_user,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllEportfoliosForUser,
          description: "Get all ePortfolios for a User. Get a list of all ePortfolios for the specified user."

        field :get_eportfolio,
          resolver: LMSGraphQL::Resolvers::Canvas::GetEportfolio,
          description: "Get an ePortfolio. Get details for a single ePortfolio."

        field :get_eportfolio_pages,
          resolver: LMSGraphQL::Resolvers::Canvas::GetEportfolioPage,
          description: "Get ePortfolio Pages. Get details for the pages of an ePortfolio"

        field :list_courses_with_their_latest_epub_export,
          resolver: LMSGraphQL::Resolvers::Canvas::ListCoursesWithTheirLatestEpubExport,
          description: "List courses with their latest ePub export. A paginated list of all courses a user is actively participating in, and   the latest ePub export associated with the user & course."

        field :show_epub_export,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowEpubExport,
          description: "Show ePub export. Get information about a single ePub export."

        field :list_external_tools_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListExternalToolsCourse,
          description: "List external tools. Returns the paginated list of external tools for the current context.   See the get request docs for a single tool for a list of properties on an external tool."

        field :list_external_tools_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListExternalToolsAccount,
          description: "List external tools. Returns the paginated list of external tools for the current context.   See the get request docs for a single tool for a list of properties on an external tool."

        field :list_external_tools_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListExternalToolsGroup,
          description: "List external tools. Returns the paginated list of external tools for the current context.   See the get request docs for a single tool for a list of properties on an external tool."

        field :get_sessionless_launch_url_for_external_tool_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSessionlessLaunchUrlForExternalToolCourse,
          description: "Get a sessionless launch url for an external tool.. Returns a sessionless launch url for an external tool.      NOTE: Either the id or url must be provided unless launch_type is assessment or module_item."

        field :get_sessionless_launch_url_for_external_tool_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSessionlessLaunchUrlForExternalToolAccount,
          description: "Get a sessionless launch url for an external tool.. Returns a sessionless launch url for an external tool.      NOTE: Either the id or url must be provided unless launch_type is assessment or module_item."

        field :get_single_external_tool_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleExternalToolCourse,
          description: "Get a single external tool. Returns the specified external tool."

        field :get_single_external_tool_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleExternalToolAccount,
          description: "Get a single external tool. Returns the specified external tool."

        field :get_visible_course_navigation_tools,
          resolver: LMSGraphQL::Resolvers::Canvas::GetVisibleCourseNavigationTool,
          description: "Get visible course navigation tools. Get a list of external tools with the course_navigation placement that have not been hidden in   course settings and whose visibility settings apply to the requesting user. These tools are the   same that appear in the course navigation.      The response format is the same as for List external tools, but with additional context_id and   context_name fields on each element in the array."

        field :get_visible_course_navigation_tools_for_single_course,
          resolver: LMSGraphQL::Resolvers::Canvas::GetVisibleCourseNavigationToolsForSingleCourse,
          description: "Get visible course navigation tools for a single course. Get a list of external tools with the course_navigation placement that have not been hidden in   course settings and whose visibility settings apply to the requesting user. These tools are the   same that appear in the course navigation.      The response format is the same as Get visible course navigation tools."

        field :list_favorite_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListFavoriteCourse,
          description: "List favorite courses. Retrieve the paginated list of favorite courses for the current user. If the user has not chosen   any favorites, then a selection of currently enrolled courses will be returned.      See the {api:CoursesController#index List courses API} for details on accepted include[] parameters."

        field :list_favorite_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListFavoriteGroup,
          description: "List favorite groups. Retrieve the paginated list of favorite groups for the current user. If the user has not chosen   any favorites, then a selection of groups that the user is a member of will be returned."

        field :list_features_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListFeaturesCourse,
          description: "List features. A paginated list of all features that apply to a given Account, Course, or User."

        field :list_features_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListFeaturesAccount,
          description: "List features. A paginated list of all features that apply to a given Account, Course, or User."

        field :list_features_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListFeaturesUser,
          description: "List features. A paginated list of all features that apply to a given Account, Course, or User."

        field :list_enabled_features_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEnabledFeaturesCourse,
          description: "List enabled features. A paginated list of all features that are enabled on a given Account, Course, or User.   Only the feature names are returned."

        field :list_enabled_features_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEnabledFeaturesAccount,
          description: "List enabled features. A paginated list of all features that are enabled on a given Account, Course, or User.   Only the feature names are returned."

        field :list_enabled_features_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEnabledFeaturesUser,
          description: "List enabled features. A paginated list of all features that are enabled on a given Account, Course, or User.   Only the feature names are returned."

        field :list_environment_features,
          resolver: LMSGraphQL::Resolvers::Canvas::ListEnvironmentFeature,
          description: "List environment features. Return a hash of global feature options that pertain to the   Canvas user interface. This is the same information supplied to the   web interface as +ENV.FEATURES+."

        field :get_feature_flag_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFeatureFlagCourse,
          description: "Get feature flag. Get the feature flag that applies to a given Account, Course, or User.   The flag may be defined on the object, or it may be inherited from a parent   account. You can look at the context_id and context_type of the returned object   to determine which is the case. If these fields are missing, then the object   is the global Canvas default."

        field :get_feature_flag_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFeatureFlagAccount,
          description: "Get feature flag. Get the feature flag that applies to a given Account, Course, or User.   The flag may be defined on the object, or it may be inherited from a parent   account. You can look at the context_id and context_type of the returned object   to determine which is the case. If these fields are missing, then the object   is the global Canvas default."

        field :get_feature_flag_users,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFeatureFlagUser,
          description: "Get feature flag. Get the feature flag that applies to a given Account, Course, or User.   The flag may be defined on the object, or it may be inherited from a parent   account. You can look at the context_id and context_type of the returned object   to determine which is the case. If these fields are missing, then the object   is the global Canvas default."

        field :get_quota_information_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetQuotaInformationCourse,
          description: "Get quota information. Returns the total and used storage quota for the course, group, or user."

        field :get_quota_information_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::GetQuotaInformationGroup,
          description: "Get quota information. Returns the total and used storage quota for the course, group, or user."

        field :get_quota_information_users,
          resolver: LMSGraphQL::Resolvers::Canvas::GetQuotaInformationUser,
          description: "Get quota information. Returns the total and used storage quota for the course, group, or user."

        field :list_files_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListFilesCourse,
          description: "List files. Returns the paginated list of files for the folder or course."

        field :list_files_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListFilesUser,
          description: "List files. Returns the paginated list of files for the folder or course."

        field :list_files_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListFilesGroup,
          description: "List files. Returns the paginated list of files for the folder or course."

        field :list_files_folders,
          resolver: LMSGraphQL::Resolvers::Canvas::ListFilesFolder,
          description: "List files. Returns the paginated list of files for the folder or course."

        field :get_public_inline_preview_url,
          resolver: LMSGraphQL::Resolvers::Canvas::GetPublicInlinePreviewUrl,
          description: "Get public inline preview url. Determine the URL that should be used for inline preview of the file."

        field :get_file_files,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFileFile,
          description: "Get file. Returns the standard attachment json object"

        field :get_file_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFileCourse,
          description: "Get file. Returns the standard attachment json object"

        field :get_file_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFileGroup,
          description: "Get file. Returns the standard attachment json object"

        field :get_file_users,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFileUser,
          description: "Get file. Returns the standard attachment json object"

        field :translate_file_reference,
          resolver: LMSGraphQL::Resolvers::Canvas::TranslateFileReference,
          description: "Translate file reference. Get information about a file from a course copy file reference"

        field :list_folders,
          resolver: LMSGraphQL::Resolvers::Canvas::ListFolder,
          description: "List folders. Returns the paginated list of folders in the folder."

        field :list_all_folders_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAllFoldersCourse,
          description: "List all folders. Returns the paginated list of all folders for the given context. This will   be returned as a flat list containing all subfolders as well."

        field :list_all_folders_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAllFoldersUser,
          description: "List all folders. Returns the paginated list of all folders for the given context. This will   be returned as a flat list containing all subfolders as well."

        field :list_all_folders_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAllFoldersGroup,
          description: "List all folders. Returns the paginated list of all folders for the given context. This will   be returned as a flat list containing all subfolders as well."

        field :resolve_path_courses_full_path,
          resolver: LMSGraphQL::Resolvers::Canvas::ResolvePathCoursesFullPath,
          description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

        field :resolve_path_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ResolvePathCourse,
          description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

        field :resolve_path_users_full_path,
          resolver: LMSGraphQL::Resolvers::Canvas::ResolvePathUsersFullPath,
          description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

        field :resolve_path_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ResolvePathUser,
          description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

        field :resolve_path_groups_full_path,
          resolver: LMSGraphQL::Resolvers::Canvas::ResolvePathGroupsFullPath,
          description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

        field :resolve_path_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ResolvePathGroup,
          description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

        field :get_folder_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFolderCourse,
          description: "Get folder. Returns the details for a folder      You can get the root folder from a context by using 'root' as the :id.   For example, you could get the root folder for a course like:"

        field :get_folder_users,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFolderUser,
          description: "Get folder. Returns the details for a folder      You can get the root folder from a context by using 'root' as the :id.   For example, you could get the root folder for a course like:"

        field :get_folder_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFolderGroup,
          description: "Get folder. Returns the details for a folder      You can get the root folder from a context by using 'root' as the :id.   For example, you could get the root folder for a course like:"

        field :get_folder_folders,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFolderFolder,
          description: "Get folder. Returns the details for a folder      You can get the root folder from a context by using 'root' as the :id.   For example, you could get the root folder for a course like:"

        field :get_uploaded_media_folder_for_user_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetUploadedMediaFolderForUserCourse,
          description: "Get uploaded media folder for user. Returns the details for a designated upload folder that the user has rights to   upload to, and creates it if it doesn't exist.      If the current user does not have the permissions to manage files   in the course or group, the folder will belong to the current user directly."

        field :get_uploaded_media_folder_for_user_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::GetUploadedMediaFolderForUserGroup,
          description: "Get uploaded media folder for user. Returns the details for a designated upload folder that the user has rights to   upload to, and creates it if it doesn't exist.      If the current user does not have the permissions to manage files   in the course or group, the folder will belong to the current user directly."

        field :list_licenses_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListLicensesCourse,
          description: "List licenses. A paginated list of licenses that can be applied"

        field :list_licenses_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListLicensesGroup,
          description: "List licenses. A paginated list of licenses that can be applied"

        field :list_licenses_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListLicensesUser,
          description: "List licenses. A paginated list of licenses that can be applied"

        field :query_by_assignment,
          resolver: LMSGraphQL::Resolvers::Canvas::QueryByAssignment,
          description: "Query by assignment. List grade change events for a given assignment."

        field :grade_change_log_query_by_course,
          resolver: LMSGraphQL::Resolvers::Canvas::GradeChangeLogQueryByCourse,
          description: "Query by course. List grade change events for a given course."

        field :query_by_student,
          resolver: LMSGraphQL::Resolvers::Canvas::QueryByStudent,
          description: "Query by student. List grade change events for a given student."

        field :query_by_grader,
          resolver: LMSGraphQL::Resolvers::Canvas::QueryByGrader,
          description: "Query by grader. List grade change events for a given grader."

        field :advanced_query,
          resolver: LMSGraphQL::Resolvers::Canvas::AdvancedQuery,
          description: "Advanced query. List grade change events satisfying all given parameters. Teachers may query for events in courses they teach.   Queries without +course_id+ require account administrator rights.      At least one of +course_id+, +assignment_id+, +student_id+, or +grader_id+ must be specified."

        field :days_in_gradebook_history_for_this_course,
          resolver: LMSGraphQL::Resolvers::Canvas::DaysInGradebookHistoryForThisCourse,
          description: "Days in gradebook history for this course. Returns a map of dates to grader/assignment groups"

        field :details_for_given_date_in_gradebook_history_for_this_course,
          resolver: LMSGraphQL::Resolvers::Canvas::DetailsForGivenDateInGradebookHistoryForThisCourse,
          description: "Details for a given date in gradebook history for this course. Returns the graders who worked on this day, along with the assignments they worked on.   More details can be obtained by selecting a grader and assignment and calling the   'submissions' api endpoint for a given date."

        field :lists_submissions,
          resolver: LMSGraphQL::Resolvers::Canvas::ListsSubmission,
          description: "Lists submissions. Gives a nested list of submission versions"

        field :list_uncollated_submission_versions,
          resolver: LMSGraphQL::Resolvers::Canvas::ListUncollatedSubmissionVersion,
          description: "List uncollated submission versions. Gives a paginated, uncollated list of submission versions for all matching   submissions in the context. This SubmissionVersion objects will not include   the +new_grade+ or +previous_grade+ keys, only the +grade+; same for   +graded_at+ and +grader+."

        field :list_grading_periods_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGradingPeriodsAccount,
          description: "List grading periods. Returns the paginated list of grading periods for the current course."

        field :list_grading_periods_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGradingPeriodsCourse,
          description: "List grading periods. Returns the paginated list of grading periods for the current course."

        field :get_single_grading_period,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleGradingPeriod,
          description: "Get a single grading period. Returns the grading period with the given id"

        field :list_grading_standards_available_in_context_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGradingStandardsAvailableInContextCourse,
          description: "List the grading standards available in a context.. Returns the paginated list of grading standards for the given context that are visible to the user."

        field :list_grading_standards_available_in_context_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGradingStandardsAvailableInContextAccount,
          description: "List the grading standards available in a context.. Returns the paginated list of grading standards for the given context that are visible to the user."

        field :get_single_grading_standard_in_context_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleGradingStandardInContextCourse,
          description: "Get a single grading standard in a context.. Returns a grading standard for the given context that is visible to the user."

        field :get_single_grading_standard_in_context_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleGradingStandardInContextAccount,
          description: "Get a single grading standard in a context.. Returns a grading standard for the given context that is visible to the user."

        field :list_group_categories_for_context_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGroupCategoriesForContextAccount,
          description: "List group categories for a context. Returns a paginated list of group categories in a context"

        field :list_group_categories_for_context_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGroupCategoriesForContextCourse,
          description: "List group categories for a context. Returns a paginated list of group categories in a context"

        field :get_single_group_category,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleGroupCategory,
          description: "Get a single group category. Returns the data for a single group category, or a 401 if the caller doesn't have   the rights to see it."

        field :list_groups_in_group_category,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGroupsInGroupCategory,
          description: "List groups in group category. Returns a paginated list of groups in a group category"

        field :export_groups_in_and_users_in_category,
          resolver: LMSGraphQL::Resolvers::Canvas::ExportGroupsInAndUsersInCategory,
          description: "export groups in and users in category. Returns a csv file of users in format ready to import."

        field :list_users_in_group_category,
          resolver: LMSGraphQL::Resolvers::Canvas::ListUsersInGroupCategory,
          description: "List users in group category. Returns a paginated list of users in the group category."

        field :list_your_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListYourGroup,
          description: "List your groups. Returns a paginated list of active groups for the current user."

        field :list_groups_available_in_context_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGroupsAvailableInContextAccount,
          description: "List the groups available in a context.. Returns the paginated list of active groups in the given context that are visible to user."

        field :list_groups_available_in_context_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGroupsAvailableInContextCourse,
          description: "List the groups available in a context.. Returns the paginated list of active groups in the given context that are visible to user."

        field :get_single_group,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleGroup,
          description: "Get a single group. Returns the data for a single group, or a 401 if the caller doesn't have   the rights to see it."

        field :list_group_s_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGroupSUser,
          description: "List group's users. Returns a paginated list of users in the group."

        field :group_activity_stream,
          resolver: LMSGraphQL::Resolvers::Canvas::GroupActivityStream,
          description: "Group activity stream. Returns the current user's group-specific activity stream, paginated.      For full documentation, see the API documentation for the user activity   stream, in the user api."

        field :group_activity_stream_summary,
          resolver: LMSGraphQL::Resolvers::Canvas::GroupActivityStreamSummary,
          description: "Group activity stream summary. Returns a summary of the current user's group-specific activity stream.      For full documentation, see the API documentation for the user activity   stream summary, in the user api."

        field :groups_permissions,
          resolver: LMSGraphQL::Resolvers::Canvas::GroupsPermission,
          description: "Permissions. Returns permission information for the calling user in the given group.   See also the {api:AccountsController#permissions Account} and   {api:CoursesController#permissions Course} counterparts."

        field :list_group_memberships,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGroupMembership,
          description: "List group memberships. A paginated list of the members of a group."

        field :get_single_group_membership_memberships,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleGroupMembershipMembership,
          description: "Get a single group membership. Returns the group membership with the given membership id or user id."

        field :get_single_group_membership_users,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleGroupMembershipUser,
          description: "Get a single group membership. Returns the group membership with the given membership id or user id."

        field :list_recent_history_for_user,
          resolver: LMSGraphQL::Resolvers::Canvas::ListRecentHistoryForUser,
          description: "List recent history for a user. Return a paginated list of the user's recent history. History entries are returned in descending order,   newest to oldest. You may list history entries for yourself (use +self+ as the user_id), for a student you observe,   or for a user you manage as an administrator. Note that the +per_page+ pagination argument is not supported   and the number of history entries returned per page will vary."

        field :find_images,
          resolver: LMSGraphQL::Resolvers::Canvas::FindImage,
          description: "Find images. Find public domain images for use in courses and user content.  If you select an image using this API, please use the {api:InternetImageController#image_selection Confirm image selection API} to indicate photo usage to the server."

        field :get_late_policy,
          resolver: LMSGraphQL::Resolvers::Canvas::GetLatePolicy,
          description: "Get a late policy. Returns the late policy for a course."

        field :show_line_item,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowLineItem,
          description: "Show a Line Item. Show existing Line Item"

        field :list_line_items,
          resolver: LMSGraphQL::Resolvers::Canvas::ListLineItem,
          description: "List line Items. List all Line Items for a course"

        field :list_live_assessment_results,
          resolver: LMSGraphQL::Resolvers::Canvas::ListLiveAssessmentResult,
          description: "List live assessment results. Returns a paginated list of live assessment results"

        field :list_live_assessments,
          resolver: LMSGraphQL::Resolvers::Canvas::ListLiveAssessment,
          description: "List live assessments. Returns a paginated list of live assessments."

        field :list_user_logins_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListUserLoginsAccount,
          description: "List user logins. Given a user ID, return a paginated list of that user's logins for the given account."

        field :list_user_logins_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListUserLoginsUser,
          description: "List user logins. Given a user ID, return a paginated list of that user's logins for the given account."

        field :list_media_tracks_for_media_object,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMediaTracksForMediaObject,
          description: "List media tracks for a Media Object. List the media tracks associated with a media object"

        field :list_media_objects_media_objects,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMediaObjectsMediaObject,
          description: "List Media Objects. Returns media objects created by the user making the request. When   using the second version, returns media objects associated with   the given course."

        field :list_media_objects_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMediaObjectsCourse,
          description: "List Media Objects. Returns media objects created by the user making the request. When   using the second version, returns media objects associated with   the given course."

        field :list_media_objects_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMediaObjectsGroup,
          description: "List Media Objects. Returns media objects created by the user making the request. When   using the second version, returns media objects associated with   the given course."

        field :list_students_selected_for_moderation,
          resolver: LMSGraphQL::Resolvers::Canvas::ListStudentsSelectedForModeration,
          description: "List students selected for moderation. Returns a paginated list of students selected for moderation"

        field :show_provisional_grade_status_for_student,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowProvisionalGradeStatusForStudent,
          description: "Show provisional grade status for a student. Tell whether the student's submission needs one or more provisional grades."

        field :moderated_grading_show_provisional_grade_status_for_student,
          resolver: LMSGraphQL::Resolvers::Canvas::ModeratedGradingShowProvisionalGradeStatusForStudent,
          description: "Show provisional grade status for a student. Determine whether or not the student's submission needs one or more provisional grades."

        field :list_modules,
          resolver: LMSGraphQL::Resolvers::Canvas::ListModule,
          description: "List modules. A paginated list of the modules in a course"

        field :show_module,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowModule,
          description: "Show module. Get information about a single module"

        field :list_module_items,
          resolver: LMSGraphQL::Resolvers::Canvas::ListModuleItem,
          description: "List module items. A paginated list of the items in a module"

        field :show_module_item,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowModuleItem,
          description: "Show module item. Get information about a single module item"

        field :get_module_item_sequence,
          resolver: LMSGraphQL::Resolvers::Canvas::GetModuleItemSequence,
          description: "Get module item sequence. Given an asset in a course, find the ModuleItem it belongs to, the previous and next Module Items   in the course sequence, and also any applicable mastery path rules"

        field :list_course_memberships,
          resolver: LMSGraphQL::Resolvers::Canvas::ListCourseMembership,
          description: "List Course Memberships. Return active NamesAndRoleMemberships in the given course."

        field :names_and_role_list_group_memberships,
          resolver: LMSGraphQL::Resolvers::Canvas::NamesAndRoleListGroupMembership,
          description: "List Group Memberships. Return active NamesAndRoleMemberships in the given group."

        field :list_preferences_communication_channel_id,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPreferencesCommunicationChannelId,
          description: "List preferences. Fetch all preferences for the given communication channel"

        field :list_preferences_type,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPreferencesType,
          description: "List preferences. Fetch all preferences for the given communication channel"

        field :list_of_preference_categories,
          resolver: LMSGraphQL::Resolvers::Canvas::ListOfPreferenceCategory,
          description: "List of preference categories. Fetch all notification preference categories for the given communication channel"

        field :get_preference_communication_channel_id,
          resolver: LMSGraphQL::Resolvers::Canvas::GetPreferenceCommunicationChannelId,
          description: "Get a preference. Fetch the preference for the given notification for the given communication channel"

        field :get_preference_type,
          resolver: LMSGraphQL::Resolvers::Canvas::GetPreferenceType,
          description: "Get a preference. Fetch the preference for the given notification for the given communication channel"

        field :show_originality_report_submissions,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowOriginalityReportSubmission,
          description: "Show an Originality Report. Get a single originality report"

        field :show_originality_report_files,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowOriginalityReportFile,
          description: "Show an Originality Report. Get a single originality report"

        field :redirect_to_root_outcome_group_for_context_global,
          resolver: LMSGraphQL::Resolvers::Canvas::RedirectToRootOutcomeGroupForContextGlobal,
          description: "Redirect to root outcome group for context. Convenience redirect to find the root outcome group for a particular   context. Will redirect to the appropriate outcome group's URL."

        field :redirect_to_root_outcome_group_for_context_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::RedirectToRootOutcomeGroupForContextAccount,
          description: "Redirect to root outcome group for context. Convenience redirect to find the root outcome group for a particular   context. Will redirect to the appropriate outcome group's URL."

        field :redirect_to_root_outcome_group_for_context_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::RedirectToRootOutcomeGroupForContextCourse,
          description: "Redirect to root outcome group for context. Convenience redirect to find the root outcome group for a particular   context. Will redirect to the appropriate outcome group's URL."

        field :get_all_outcome_groups_for_context_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllOutcomeGroupsForContextAccount,
          description: "Get all outcome groups for context. "

        field :get_all_outcome_groups_for_context_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllOutcomeGroupsForContextCourse,
          description: "Get all outcome groups for context. "

        field :get_all_outcome_links_for_context_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllOutcomeLinksForContextAccount,
          description: "Get all outcome links for context. "

        field :get_all_outcome_links_for_context_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllOutcomeLinksForContextCourse,
          description: "Get all outcome links for context. "

        field :show_outcome_group_global,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowOutcomeGroupGlobal,
          description: "Show an outcome group. "

        field :show_outcome_group_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowOutcomeGroupAccount,
          description: "Show an outcome group. "

        field :show_outcome_group_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowOutcomeGroupCourse,
          description: "Show an outcome group. "

        field :list_linked_outcomes_global,
          resolver: LMSGraphQL::Resolvers::Canvas::ListLinkedOutcomesGlobal,
          description: "List linked outcomes. A paginated list of the immediate OutcomeLink children of the outcome group."

        field :list_linked_outcomes_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListLinkedOutcomesAccount,
          description: "List linked outcomes. A paginated list of the immediate OutcomeLink children of the outcome group."

        field :list_linked_outcomes_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListLinkedOutcomesCourse,
          description: "List linked outcomes. A paginated list of the immediate OutcomeLink children of the outcome group."

        field :list_subgroups_global,
          resolver: LMSGraphQL::Resolvers::Canvas::ListSubgroupsGlobal,
          description: "List subgroups. A paginated list of the immediate OutcomeGroup children of the outcome group."

        field :list_subgroups_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListSubgroupsAccount,
          description: "List subgroups. A paginated list of the immediate OutcomeGroup children of the outcome group."

        field :list_subgroups_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListSubgroupsCourse,
          description: "List subgroups. A paginated list of the immediate OutcomeGroup children of the outcome group."

        field :get_outcome_import_status_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetOutcomeImportStatusAccount,
          description: "Get Outcome import status. Get the status of an already created Outcome import. Pass 'latest' for the outcome import id   for the latest import.        Examples:       curl 'https: <canvas>/api/v1/accounts/<account_id>/outcome_imports/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'       curl 'https: <canvas>/api/v1/courses/<course_id>/outcome_imports/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'"

        field :get_outcome_import_status_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetOutcomeImportStatusCourse,
          description: "Get Outcome import status. Get the status of an already created Outcome import. Pass 'latest' for the outcome import id   for the latest import.        Examples:       curl 'https: <canvas>/api/v1/accounts/<account_id>/outcome_imports/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'       curl 'https: <canvas>/api/v1/courses/<course_id>/outcome_imports/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'"

        field :get_ids_of_outcome_groups_created_after_successful_import_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetIdsOfOutcomeGroupsCreatedAfterSuccessfulImportAccount,
          description: "Get IDs of outcome groups created after successful import. Get the IDs of the outcome groups created after a successful import.   Pass 'latest' for the outcome import id for the latest import.        Examples:       curl 'https: <canvas>/api/v1/accounts/<account_id>/outcome_imports/outcomes_group_ids/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'       curl 'https: <canvas>/api/v1/courses/<course_id>/outcome_imports/outcome_group_ids/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'"

        field :get_ids_of_outcome_groups_created_after_successful_import_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetIdsOfOutcomeGroupsCreatedAfterSuccessfulImportCourse,
          description: "Get IDs of outcome groups created after successful import. Get the IDs of the outcome groups created after a successful import.   Pass 'latest' for the outcome import id for the latest import.        Examples:       curl 'https: <canvas>/api/v1/accounts/<account_id>/outcome_imports/outcomes_group_ids/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'       curl 'https: <canvas>/api/v1/courses/<course_id>/outcome_imports/outcome_group_ids/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'"

        field :get_outcome_results,
          resolver: LMSGraphQL::Resolvers::Canvas::GetOutcomeResult,
          description: "Get outcome results. Gets the outcome results for users and outcomes in the specified context."

        field :get_outcome_result_rollups,
          resolver: LMSGraphQL::Resolvers::Canvas::GetOutcomeResultRollup,
          description: "Get outcome result rollups. Gets the outcome rollups for the users and outcomes in the specified   context."

        field :show_outcome,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowOutcome,
          description: "Show an outcome. Returns the details of the outcome with the given id."

        field :get_aligned_assignments_for_outcome_in_course_for_particular_student,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAlignedAssignmentsForOutcomeInCourseForParticularStudent,
          description: "Get aligned assignments for an outcome in a course for a particular student. "

        field :show_front_page_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowFrontPageCourse,
          description: "Show front page. Retrieve the content of the front page"

        field :show_front_page_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowFrontPageGroup,
          description: "Show front page. Retrieve the content of the front page"

        field :list_pages_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPagesCourse,
          description: "List pages. A paginated list of the wiki pages associated with a course or group"

        field :list_pages_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPagesGroup,
          description: "List pages. A paginated list of the wiki pages associated with a course or group"

        field :show_page_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowPageCourse,
          description: "Show page. Retrieve the content of a wiki page"

        field :show_page_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowPageGroup,
          description: "Show page. Retrieve the content of a wiki page"

        field :list_revisions_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListRevisionsCourse,
          description: "List revisions. A paginated list of the revisions of a page. Callers must have update rights on the page in order to see page history."

        field :list_revisions_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListRevisionsGroup,
          description: "List revisions. A paginated list of the revisions of a page. Callers must have update rights on the page in order to see page history."

        field :show_revision_courses_latest,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowRevisionCoursesLatest,
          description: "Show revision. Retrieve the metadata and optionally content of a revision of the page.   Note that retrieving historic versions of pages requires edit rights."

        field :show_revision_groups_latest,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowRevisionGroupsLatest,
          description: "Show revision. Retrieve the metadata and optionally content of a revision of the page.   Note that retrieving historic versions of pages requires edit rights."

        field :show_revision_courses_revision_id,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowRevisionCoursesRevisionId,
          description: "Show revision. Retrieve the metadata and optionally content of a revision of the page.   Note that retrieving historic versions of pages requires edit rights."

        field :show_revision_groups_revision_id,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowRevisionGroupsRevisionId,
          description: "Show revision. Retrieve the metadata and optionally content of a revision of the page.   Note that retrieving historic versions of pages requires edit rights."

        field :get_all_peer_reviews_courses_peer_reviews,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllPeerReviewsCoursesPeerReview,
          description: "Get all Peer Reviews. Get a list of all Peer Reviews for this assignment"

        field :get_all_peer_reviews_sections_peer_reviews,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllPeerReviewsSectionsPeerReview,
          description: "Get all Peer Reviews. Get a list of all Peer Reviews for this assignment"

        field :get_all_peer_reviews_courses_submissions,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllPeerReviewsCoursesSubmission,
          description: "Get all Peer Reviews. Get a list of all Peer Reviews for this assignment"

        field :get_all_peer_reviews_sections_submissions,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllPeerReviewsSectionsSubmission,
          description: "Get all Peer Reviews. Get a list of all Peer Reviews for this assignment"

        field :get_single_assignment_lti,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleAssignmentLti,
          description: "Get a single assignment (lti). Get a single Canvas assignment by Canvas id or LTI id. Tool providers may only access   assignments that are associated with their tool."

        field :get_single_user_lti,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleUserLti,
          description: "Get a single user (lti). Get a single Canvas user by Canvas id or LTI id. Tool providers may only access   users that have been assigned an assignment associated with their tool."

        field :get_all_users_in_group_lti,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllUsersInGroupLti,
          description: "Get all users in a group (lti). Get all Canvas users in a group. Tool providers may only access   groups that belong to the context the tool is installed in."

        field :get_single_submission,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleSubmission,
          description: "Get a single submission. Get a single submission, based on submission id."

        field :get_history_of_single_submission,
          resolver: LMSGraphQL::Resolvers::Canvas::GetHistoryOfSingleSubmission,
          description: "Get the history of a single submission. Get a list of all attempts made for a submission, based on submission id."

        field :list_planner_items_planner,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPlannerItemsPlanner,
          description: "List planner items. Retrieve the paginated list of objects to be shown on the planner for the   current user with the associated planner override to override an item's   visibility if set.      Planner items for a student may also be retrieved by a linked observer. Use   the path that accepts a user_id and supply the student's id."

        field :list_planner_items_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPlannerItemsUser,
          description: "List planner items. Retrieve the paginated list of objects to be shown on the planner for the   current user with the associated planner override to override an item's   visibility if set.      Planner items for a student may also be retrieved by a linked observer. Use   the path that accepts a user_id and supply the student's id."

        field :list_planner_notes,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPlannerNote,
          description: "List planner notes. Retrieve the paginated list of planner notes      Retrieve planner note for a user"

        field :show_planner_note,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowPlannerNote,
          description: "Show a planner note. Retrieve a planner note for the current user"

        field :list_planner_overrides,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPlannerOverride,
          description: "List planner overrides. Retrieve a planner override for the current user"

        field :show_planner_override,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowPlannerOverride,
          description: "Show a planner override. Retrieve a planner override for the current user"

        field :list_poll_sessions_for_poll,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPollSessionsForPoll,
          description: "List poll sessions for a poll. Returns the paginated list of PollSessions in this poll."

        field :get_results_for_single_poll_session,
          resolver: LMSGraphQL::Resolvers::Canvas::GetResultsForSinglePollSession,
          description: "Get the results for a single poll session. Returns the poll session with the given id"

        field :open_poll_session,
          resolver: LMSGraphQL::Resolvers::Canvas::OpenPollSession,
          description: "Open a poll session. "

        field :close_opened_poll_session,
          resolver: LMSGraphQL::Resolvers::Canvas::CloseOpenedPollSession,
          description: "Close an opened poll session. "

        field :list_opened_poll_sessions,
          resolver: LMSGraphQL::Resolvers::Canvas::ListOpenedPollSession,
          description: "List opened poll sessions. A paginated list of all opened poll sessions available to the current user."

        field :list_closed_poll_sessions,
          resolver: LMSGraphQL::Resolvers::Canvas::ListClosedPollSession,
          description: "List closed poll sessions. A paginated list of all closed poll sessions available to the current user."

        field :list_poll_choices_in_poll,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPollChoicesInPoll,
          description: "List poll choices in a poll. Returns the paginated list of PollChoices in this poll."

        field :get_single_poll_choice,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSinglePollChoice,
          description: "Get a single poll choice. Returns the poll choice with the given id"

        field :list_polls,
          resolver: LMSGraphQL::Resolvers::Canvas::ListPoll,
          description: "List polls. Returns the paginated list of polls for the current user."

        field :get_single_poll,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSinglePoll,
          description: "Get a single poll. Returns the poll with the given id"

        field :get_single_poll_submission,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSinglePollSubmission,
          description: "Get a single poll submission. Returns the poll submission with the given id"

        field :get_proficiency_ratings_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetProficiencyRatingsAccount,
          description: "Get proficiency ratings. Get account-level proficiency ratings. If not defined for this account,   it will return proficiency ratings for the nearest super-account with ratings defined.   Will return 404 if none found.        Examples:       curl https: <canvas>/api/v1/accounts/<account_id>/outcome_proficiency \           -H 'Authorization: Bearer <token>'"

        field :get_proficiency_ratings_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetProficiencyRatingsCourse,
          description: "Get proficiency ratings. Get account-level proficiency ratings. If not defined for this account,   it will return proficiency ratings for the nearest super-account with ratings defined.   Will return 404 if none found.        Examples:       curl https: <canvas>/api/v1/accounts/<account_id>/outcome_proficiency \           -H 'Authorization: Bearer <token>'"

        field :query_progress,
          resolver: LMSGraphQL::Resolvers::Canvas::QueryProgress,
          description: "Query progress. Return completion and status information about an asynchronous job"

        field :progress_query_progress,
          resolver: LMSGraphQL::Resolvers::Canvas::ProgressQueryProgress,
          description: "Query progress. Return completion and status information about an asynchronous job"

        field :retrieve_assignment_overridden_dates_for_classic_quizzes,
          resolver: LMSGraphQL::Resolvers::Canvas::RetrieveAssignmentOverriddenDatesForClassicQuiz,
          description: "Retrieve assignment-overridden dates for Classic Quizzes. Retrieve the actual due-at, unlock-at, and available-at dates for quizzes   based on the assignment overrides active for the current API user."

        field :retrieve_assignment_overridden_dates_for_new_quizzes,
          resolver: LMSGraphQL::Resolvers::Canvas::RetrieveAssignmentOverriddenDatesForNewQuiz,
          description: "Retrieve assignment-overridden dates for New Quizzes. Retrieve the actual due-at, unlock-at, and available-at dates for quizzes   based on the assignment overrides active for the current API user."

        field :get_available_quiz_ip_filters,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAvailableQuizIpFilter,
          description: "Get available quiz IP filters.. Get a list of available IP filters for this Quiz.      <b>200 OK</b> response code is returned if the request was successful."

        field :get_single_quiz_group,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleQuizGroup,
          description: "Get a single quiz group. Returns details of the quiz group with the given id."

        field :list_questions_in_quiz_or_submission,
          resolver: LMSGraphQL::Resolvers::Canvas::ListQuestionsInQuizOrSubmission,
          description: "List questions in a quiz or a submission. Returns the paginated list of QuizQuestions in this quiz."

        field :get_single_quiz_question,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleQuizQuestion,
          description: "Get a single quiz question. Returns the quiz question with the given id"

        field :retrieve_all_quiz_reports,
          resolver: LMSGraphQL::Resolvers::Canvas::RetrieveAllQuizReport,
          description: "Retrieve all quiz reports. Returns a list of all available reports."

        field :get_quiz_report,
          resolver: LMSGraphQL::Resolvers::Canvas::GetQuizReport,
          description: "Get a quiz report. Returns the data for a single quiz report."

        field :fetching_latest_quiz_statistics,
          resolver: LMSGraphQL::Resolvers::Canvas::FetchingLatestQuizStatistic,
          description: "Fetching the latest quiz statistics. This endpoint provides statistics for all quiz versions, or for a specific   quiz version, in which case the output is guaranteed to represent the   _latest_ and most current version of the quiz.      <b>200 OK</b> response code is returned if the request was successful."

        field :retrieve_captured_events,
          resolver: LMSGraphQL::Resolvers::Canvas::RetrieveCapturedEvent,
          description: "Retrieve captured events. Retrieve the set of events captured during a specific submission attempt."

        field :get_all_quiz_submission_questions,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllQuizSubmissionQuestion,
          description: "Get all quiz submission questions.. Get a list of all the question records for this quiz submission.      <b>200 OK</b> response code is returned if the request was successful."

        field :get_formatted_student_numerical_answer,
          resolver: LMSGraphQL::Resolvers::Canvas::GetFormattedStudentNumericalAnswer,
          description: "Get a formatted student numerical answer.. Matches the intended behavior of the UI when a numerical answer is entered   and returns the resulting formatted number"

        field :get_all_quiz_submissions,
          resolver: LMSGraphQL::Resolvers::Canvas::GetAllQuizSubmission,
          description: "Get all quiz submissions.. Get a list of all submissions for this quiz. Users who can view or manage   grades for a course will have submissions from multiple users returned. A   user who can only submit will have only their own submissions returned. When   a user has an in-progress submission, only that submission is returned. When   there isn't an in-progress quiz_submission, all completed submissions,   including previous attempts, are returned.      <b>200 OK</b> response code is returned if the request was successful."

        field :get_quiz_submission,
          resolver: LMSGraphQL::Resolvers::Canvas::GetQuizSubmission,
          description: "Get the quiz submission.. Get the submission for this quiz for the current user.      <b>200 OK</b> response code is returned if the request was successful."

        field :get_single_quiz_submission,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleQuizSubmission,
          description: "Get a single quiz submission.. Get a single quiz submission.      <b>200 OK</b> response code is returned if the request was successful."

        field :get_current_quiz_submission_times,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCurrentQuizSubmissionTime,
          description: "Get current quiz submission times.. Get the current timing data for the quiz attempt, both the end_at timestamp   and the time_left parameter.      <b>Responses</b>      * <b>200 OK</b> if the request was successful"

        field :list_quizzes_in_course,
          resolver: LMSGraphQL::Resolvers::Canvas::ListQuizzesInCourse,
          description: "List quizzes in a course. Returns the paginated list of Quizzes in this course."

        field :get_single_quiz,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleQuiz,
          description: "Get a single quiz. Returns the quiz with the given id."

        field :show_collection_of_results,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowCollectionOfResult,
          description: "Show a collection of Results. Show existing Results of a line item. Can be used to retrieve a specific student's   result by adding the user_id (defined as the lti_user_id or the Canvas user_id) as   a query parameter (i.e. user_id=1000). If user_id is included, it will return only   one Result in the collection if the result exists, otherwise it will be empty. May   also limit number of results by adding the limit query param (i.e. limit=100)"

        field :show_result,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowResult,
          description: "Show a Result. Show existing Result of a line item."

        field :list_roles,
          resolver: LMSGraphQL::Resolvers::Canvas::ListRole,
          description: "List roles. A paginated list of the roles available to an account."

        field :get_single_role,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleRole,
          description: "Get a single role. Retrieve information about a single role"

        field :list_rubrics_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListRubricsAccount,
          description: "List rubrics. Returns the paginated list of active rubrics for the current context."

        field :list_rubrics_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListRubricsCourse,
          description: "List rubrics. Returns the paginated list of active rubrics for the current context."

        field :get_single_rubric_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleRubricAccount,
          description: "Get a single rubric. Returns the rubric with the given id."

        field :get_single_rubric_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleRubricCourse,
          description: "Get a single rubric. Returns the rubric with the given id."

        field :find_recipients_conversations,
          resolver: LMSGraphQL::Resolvers::Canvas::FindRecipientsConversation,
          description: "Find recipients. Find valid recipients (users, courses and groups) that the current user   can send messages to. The /api/v1/search/recipients path is the preferred   endpoint, /api/v1/conversations/find_recipients is deprecated.      Pagination is supported."

        field :find_recipients_search,
          resolver: LMSGraphQL::Resolvers::Canvas::FindRecipientsSearch,
          description: "Find recipients. Find valid recipients (users, courses and groups) that the current user   can send messages to. The /api/v1/search/recipients path is the preferred   endpoint, /api/v1/conversations/find_recipients is deprecated.      Pagination is supported."

        field :list_all_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAllCourse,
          description: "List all courses. A paginated list of all courses visible in the public index"

        field :list_course_sections,
          resolver: LMSGraphQL::Resolvers::Canvas::ListCourseSection,
          description: "List course sections. A paginated list of the list of sections for this course."

        field :get_section_information_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSectionInformationCourse,
          description: "Get section information. Gets details about a specific section"

        field :get_section_information_sections,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSectionInformationSection,
          description: "Get section information. Gets details about a specific section"

        field :get_kaltura_config,
          resolver: LMSGraphQL::Resolvers::Canvas::GetKalturaConfig,
          description: "Get Kaltura config. Return the config information for the Kaltura plugin in json format."

        field :get_sis_import_error_list_sis_imports,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSisImportErrorListSisImport,
          description: "Get SIS import error list. Returns the list of SIS import errors for an account or a SIS import. Import   errors are only stored for 30 days.      Example:     curl 'https: <canvas>/api/v1/accounts/<account_id>/sis_imports/<id>/sis_import_errors' \       -H 'Authorization: Bearer <token>'      Example:     curl 'https: <canvas>/api/v1/accounts/<account_id>/sis_import_errors' \       -H 'Authorization: Bearer <token>'"

        field :get_sis_import_error_list_sis_import_errors,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSisImportErrorListSisImportError,
          description: "Get SIS import error list. Returns the list of SIS import errors for an account or a SIS import. Import   errors are only stored for 30 days.      Example:     curl 'https: <canvas>/api/v1/accounts/<account_id>/sis_imports/<id>/sis_import_errors' \       -H 'Authorization: Bearer <token>'      Example:     curl 'https: <canvas>/api/v1/accounts/<account_id>/sis_import_errors' \       -H 'Authorization: Bearer <token>'"

        field :get_sis_import_list,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSisImportList,
          description: "Get SIS import list. Returns the list of SIS imports for an account      Example:     curl https: <canvas>/api/v1/accounts/<account_id>/sis_imports \       -H 'Authorization: Bearer <token>'"

        field :get_current_importing_sis_import,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCurrentImportingSisImport,
          description: "Get the current importing SIS import. Returns the SIS imports that are currently processing for an account. If no   imports are running, will return an empty array.      Example:     curl https: <canvas>/api/v1/accounts/<account_id>/sis_imports/importing \       -H 'Authorization: Bearer <token>'"

        field :get_sis_import_status,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSisImportStatus,
          description: "Get SIS import status. Get the status of an already created SIS import.        Examples:       curl https: <canvas>/api/v1/accounts/<account_id>/sis_imports/<sis_import_id> \           -H 'Authorization: Bearer <token>'"

        field :retrieve_assignments_enabled_for_grade_export_to_sis_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::RetrieveAssignmentsEnabledForGradeExportToSisAccount,
          description: "Retrieve assignments enabled for grade export to SIS. Retrieve a list of published assignments flagged as 'post_to_sis'.   See the Assignments API for more details on assignments.   Assignment group and section information are included for convenience.      Each section includes course information for the origin course and the   cross-listed course, if applicable. The `origin_course` is the course to   which the section belongs or the course from which the section was   cross-listed. Generally, the `origin_course` should be preferred when   performing integration work. The `xlist_course` is provided for consistency   and is only present when the section has been cross-listed.   See Sections API and Courses Api for me details.      The `override` is only provided if the Differentiated Assignments course   feature is turned on and the assignment has an override for that section.   When there is an override for the assignment the override object's   keys/values can be merged with the top level assignment object to create a   view of the assignment object specific to that section.   See Assignments api for more information on assignment overrides.      restricts to courses that start before this date (if they have a start date)   restricts to courses that end after this date (if they have an end date)   information to include.        'student_overrides':: returns individual student override information"

        field :retrieve_assignments_enabled_for_grade_export_to_sis_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::RetrieveAssignmentsEnabledForGradeExportToSisCourse,
          description: "Retrieve assignments enabled for grade export to SIS. Retrieve a list of published assignments flagged as 'post_to_sis'.   See the Assignments API for more details on assignments.   Assignment group and section information are included for convenience.      Each section includes course information for the origin course and the   cross-listed course, if applicable. The `origin_course` is the course to   which the section belongs or the course from which the section was   cross-listed. Generally, the `origin_course` should be preferred when   performing integration work. The `xlist_course` is provided for consistency   and is only present when the section has been cross-listed.   See Sections API and Courses Api for me details.      The `override` is only provided if the Differentiated Assignments course   feature is turned on and the assignment has an override for that section.   When there is an override for the assignment the override object's   keys/values can be merged with the top level assignment object to create a   view of the assignment object specific to that section.   See Assignments api for more information on assignment overrides.      restricts to courses that start before this date (if they have a start date)   restricts to courses that end after this date (if they have an end date)   information to include.        'student_overrides':: returns individual student override information"

        field :list_assignment_submissions_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAssignmentSubmissionsCourse,
          description: "List assignment submissions. A paginated list of all existing submissions for an assignment."

        field :list_assignment_submissions_sections,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAssignmentSubmissionsSection,
          description: "List assignment submissions. A paginated list of all existing submissions for an assignment."

        field :list_submissions_for_multiple_assignments_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListSubmissionsForMultipleAssignmentsCourse,
          description: "List submissions for multiple assignments. A paginated list of all existing submissions for a given set of students and assignments."

        field :list_submissions_for_multiple_assignments_sections,
          resolver: LMSGraphQL::Resolvers::Canvas::ListSubmissionsForMultipleAssignmentsSection,
          description: "List submissions for multiple assignments. A paginated list of all existing submissions for a given set of students and assignments."

        field :get_single_submission_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleSubmissionCourse,
          description: "Get a single submission. Get a single submission, based on user id."

        field :get_single_submission_sections,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleSubmissionSection,
          description: "Get a single submission. Get a single submission, based on user id."

        field :get_single_submission_by_anonymous_id_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleSubmissionByAnonymousIdCourse,
          description: "Get a single submission by anonymous id. Get a single submission, based on the submission's anonymous id."

        field :get_single_submission_by_anonymous_id_sections,
          resolver: LMSGraphQL::Resolvers::Canvas::GetSingleSubmissionByAnonymousIdSection,
          description: "Get a single submission by anonymous id. Get a single submission, based on the submission's anonymous id."

        field :list_gradeable_students,
          resolver: LMSGraphQL::Resolvers::Canvas::ListGradeableStudent,
          description: "List gradeable students. A paginated list of students eligible to submit the assignment. The caller must have permission to view grades.      If anonymous grading is enabled for the current assignment and the allow_new_anonymous_id parameter is passed,   the returned data will not include any values identifying the student, but will instead include an   assignment-specific anonymous ID for each student.      Section-limited instructors will only see students in their own sections."

        field :list_multiple_assignments_gradeable_students,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMultipleAssignmentsGradeableStudent,
          description: "List multiple assignments gradeable students. A paginated list of students eligible to submit a list of assignments. The caller must have   permission to view grades for the requested course.      Section-limited instructors will only see students in their own sections."

        field :get_rubric_assessments_read_state_courses_rubric_comments,
          resolver: LMSGraphQL::Resolvers::Canvas::GetRubricAssessmentsReadStateCoursesRubricComment,
          description: "Get rubric assessments read state. Return whether new rubric comments/grading made on a submission have been seen by the student being assessed."

        field :get_rubric_assessments_read_state_courses_rubric_assessments,
          resolver: LMSGraphQL::Resolvers::Canvas::GetRubricAssessmentsReadStateCoursesRubricAssessment,
          description: "Get rubric assessments read state. Return whether new rubric comments/grading made on a submission have been seen by the student being assessed."

        field :get_rubric_assessments_read_state_sections_rubric_comments,
          resolver: LMSGraphQL::Resolvers::Canvas::GetRubricAssessmentsReadStateSectionsRubricComment,
          description: "Get rubric assessments read state. Return whether new rubric comments/grading made on a submission have been seen by the student being assessed."

        field :get_rubric_assessments_read_state_sections_rubric_assessments,
          resolver: LMSGraphQL::Resolvers::Canvas::GetRubricAssessmentsReadStateSectionsRubricAssessment,
          description: "Get rubric assessments read state. Return whether new rubric comments/grading made on a submission have been seen by the student being assessed."

        field :get_document_annotations_read_state_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDocumentAnnotationsReadStateCourse,
          description: "Get document annotations read state. Return whether annotations made on a submitted document have been read by the student"

        field :get_document_annotations_read_state_sections,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDocumentAnnotationsReadStateSection,
          description: "Get document annotations read state. Return whether annotations made on a submitted document have been read by the student"

        field :submission_summary_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::SubmissionSummaryCourse,
          description: "Submission Summary. Returns the number of submissions for the given assignment based on gradeable students   that fall into three categories: graded, ungraded, not submitted."

        field :submission_summary_sections,
          resolver: LMSGraphQL::Resolvers::Canvas::SubmissionSummarySection,
          description: "Submission Summary. Returns the number of submissions for the given assignment based on gradeable students   that fall into three categories: graded, ungraded, not submitted."

        field :list_available_tabs_for_course_or_group_accounts,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAvailableTabsForCourseOrGroupAccount,
          description: "List available tabs for a course or group. Returns a paginated list of navigation tabs available in the current context."

        field :list_available_tabs_for_course_or_group_courses,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAvailableTabsForCourseOrGroupCourse,
          description: "List available tabs for a course or group. Returns a paginated list of navigation tabs available in the current context."

        field :list_available_tabs_for_course_or_group_groups,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAvailableTabsForCourseOrGroupGroup,
          description: "List available tabs for a course or group. Returns a paginated list of navigation tabs available in the current context."

        field :list_available_tabs_for_course_or_group_users,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAvailableTabsForCourseOrGroupUser,
          description: "List available tabs for a course or group. Returns a paginated list of navigation tabs available in the current context."

        field :list_observees,
          resolver: LMSGraphQL::Resolvers::Canvas::ListObservee,
          description: "List observees. A paginated list of the users that the given user is observing.      *Note:* all users are allowed to list their own observees. Administrators can list   other users' observees.      The returned observees will include an attribute 'observation_link_root_account_ids', a list   of ids for the root accounts the observer and observee are linked on. The observer will only be able to   observe in courses associated with these root accounts."

        field :list_observers,
          resolver: LMSGraphQL::Resolvers::Canvas::ListObserver,
          description: "List observers. A paginated list of the observers of a given user.      *Note:* all users are allowed to list their own observers. Administrators can list   other users' observers.      The returned observers will include an attribute 'observation_link_root_account_ids', a list   of ids for the root accounts the observer and observee are linked on. The observer will only be able to   observe in courses associated with these root accounts."

        field :show_observee,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowObservee,
          description: "Show an observee. Gets information about an observed user.      *Note:* all users are allowed to view their own observees."

        field :show_observer,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowObserver,
          description: "Show an observer. Gets information about an observer.      *Note:* all users are allowed to view their own observers."

        field :list_users_in_account,
          resolver: LMSGraphQL::Resolvers::Canvas::ListUsersInAccount,
          description: "List users in account. A paginated list of of users associated with this account.       @example_request      curl https: <canvas>/api/v1/accounts/self/users?search_term=<search value> \         -X GET \         -H 'Authorization: Bearer <token>'"

        field :list_activity_stream_self,
          resolver: LMSGraphQL::Resolvers::Canvas::ListActivityStreamSelf,
          description: "List the activity stream. Returns the current user's global activity stream, paginated.      There are many types of objects that can be returned in the activity   stream. All object types have the same basic set of shared attributes:     !!!javascript     {       'created_at': '2011-07-13T09:12:00Z',       'updated_at': '2011-07-25T08:52:41Z',       'id': 1234,       'title': 'Stream Item Subject',       'message': 'This is the body text of the activity stream item. It is plain-text, and can be multiple paragraphs.',       'type': 'DiscussionTopic|Conversation|Message|Submission|Conference|Collaboration|AssessmentRequest...',       'read_state': false,       'context_type': 'course',   course|group       'course_id': 1,       'group_id': null,       'html_url': 'http: ...'   URL to the Canvas web UI for this stream item     }      In addition, each item type has its own set of attributes available.      DiscussionTopic:        !!!javascript     {       'type': 'DiscussionTopic',       'discussion_topic_id': 1234,       'total_root_discussion_entries': 5,       'require_initial_post': true,       'user_has_posted': true,       'root_discussion_entries': {         ...       }     }      For DiscussionTopic, the message is truncated at 4kb.      Announcement:        !!!javascript     {       'type': 'Announcement',       'announcement_id': 1234,       'total_root_discussion_entries': 5,       'require_initial_post': true,       'user_has_posted': null,       'root_discussion_entries': {         ...       }     }      For Announcement, the message is truncated at 4kb.      Conversation:        !!!javascript     {       'type': 'Conversation',       'conversation_id': 1234,       'private': false,       'participant_count': 3,     }      Message:        !!!javascript     {       'type': 'Message',       'message_id': 1234,       'notification_category': 'Assignment Graded'     }      Submission:      Returns an {api:Submissions:Submission Submission} with its Course and Assignment data.      Conference:        !!!javascript     {       'type': 'Conference',       'web_conference_id': 1234     }      Collaboration:        !!!javascript     {       'type': 'Collaboration',       'collaboration_id': 1234     }      AssessmentRequest:        !!!javascript     {       'type': 'AssessmentRequest',       'assessment_request_id': 1234     }"

        field :list_activity_stream_activity_stream,
          resolver: LMSGraphQL::Resolvers::Canvas::ListActivityStreamActivityStream,
          description: "List the activity stream. Returns the current user's global activity stream, paginated.      There are many types of objects that can be returned in the activity   stream. All object types have the same basic set of shared attributes:     !!!javascript     {       'created_at': '2011-07-13T09:12:00Z',       'updated_at': '2011-07-25T08:52:41Z',       'id': 1234,       'title': 'Stream Item Subject',       'message': 'This is the body text of the activity stream item. It is plain-text, and can be multiple paragraphs.',       'type': 'DiscussionTopic|Conversation|Message|Submission|Conference|Collaboration|AssessmentRequest...',       'read_state': false,       'context_type': 'course',   course|group       'course_id': 1,       'group_id': null,       'html_url': 'http: ...'   URL to the Canvas web UI for this stream item     }      In addition, each item type has its own set of attributes available.      DiscussionTopic:        !!!javascript     {       'type': 'DiscussionTopic',       'discussion_topic_id': 1234,       'total_root_discussion_entries': 5,       'require_initial_post': true,       'user_has_posted': true,       'root_discussion_entries': {         ...       }     }      For DiscussionTopic, the message is truncated at 4kb.      Announcement:        !!!javascript     {       'type': 'Announcement',       'announcement_id': 1234,       'total_root_discussion_entries': 5,       'require_initial_post': true,       'user_has_posted': null,       'root_discussion_entries': {         ...       }     }      For Announcement, the message is truncated at 4kb.      Conversation:        !!!javascript     {       'type': 'Conversation',       'conversation_id': 1234,       'private': false,       'participant_count': 3,     }      Message:        !!!javascript     {       'type': 'Message',       'message_id': 1234,       'notification_category': 'Assignment Graded'     }      Submission:      Returns an {api:Submissions:Submission Submission} with its Course and Assignment data.      Conference:        !!!javascript     {       'type': 'Conference',       'web_conference_id': 1234     }      Collaboration:        !!!javascript     {       'type': 'Collaboration',       'collaboration_id': 1234     }      AssessmentRequest:        !!!javascript     {       'type': 'AssessmentRequest',       'assessment_request_id': 1234     }"

        field :activity_stream_summary,
          resolver: LMSGraphQL::Resolvers::Canvas::ActivityStreamSummary,
          description: "Activity stream summary. Returns a summary of the current user's global activity stream."

        field :list_todo_items,
          resolver: LMSGraphQL::Resolvers::Canvas::ListTodoItem,
          description: "List the TODO items. A paginated list of the current user's list of todo items.      There is a limit to the number of items returned.      The `ignore` and `ignore_permanently` URLs can be used to update the user's   preferences on what items will be displayed.   Performing a DELETE request against the `ignore` URL will hide that item   from future todo item requests, until the item changes.   Performing a DELETE request against the `ignore_permanently` URL will hide   that item forever."

        field :list_counts_for_todo_items,
          resolver: LMSGraphQL::Resolvers::Canvas::ListCountsForTodoItem,
          description: "List counts for todo items. Counts of different todo items such as the number of assignments needing grading as well as the number of assignments needing submitting.      There is a limit to the number of todo items this endpoint will count.   It will only look at the first 100 todo items for the user. If the user has more than 100 todo items this count may not be reliable.   The largest reliable number for both counts is 100."

        field :list_upcoming_assignments_calendar_events,
          resolver: LMSGraphQL::Resolvers::Canvas::ListUpcomingAssignmentsCalendarEvent,
          description: "List upcoming assignments, calendar events. A paginated list of the current user's upcoming events."

        field :list_missing_submissions,
          resolver: LMSGraphQL::Resolvers::Canvas::ListMissingSubmission,
          description: "List Missing Submissions. A paginated list of past-due assignments for which the student does not have a submission.   The user sending the request must either be the student, an admin or a parent observer using the parent app"

        field :show_user_details,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowUserDetail,
          description: "Show user details. Shows details for user.      Also includes an attribute 'permissions', a non-comprehensive list of permissions for the user.   Example:     !!!javascript     'permissions': {      'can_update_name': true,   Whether the user can update their name.      'can_update_avatar': false,   Whether the user can update their avatar.      'limit_parent_app_web_access': false   Whether the user can interact with Canvas web from the Canvas Parent app.     }"

        field :update_user_settings,
          resolver: LMSGraphQL::Resolvers::Canvas::UpdateUserSetting,
          description: "Update user settings.. Update an existing user's settings."

        field :get_custom_colors,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCustomColors,
          description: "Get custom colors. Returns all custom colors that have been saved for a user."

        field :get_custom_color,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCustomColor,
          description: "Get custom color. Returns the custom colors that have been saved for a user for a given context.      The asset_string parameter should be in the format 'context_id', for example   'course_42'."

        field :get_dashboard_positions,
          resolver: LMSGraphQL::Resolvers::Canvas::GetDashboardPosition,
          description: "Get dashboard positions. Returns all dashboard positions that have been saved for a user."

        field :get_users_most_recently_graded_submissions,
          resolver: LMSGraphQL::Resolvers::Canvas::GetUsersMostRecentlyGradedSubmission,
          description: "Get a users most recently graded submissions. "

        field :get_user_profile,
          resolver: LMSGraphQL::Resolvers::Canvas::GetUserProfile,
          description: "Get user profile. Returns user profile data, including user id, name, and profile pic.      When requesting the profile for the user accessing the API, the user's   calendar feed URL and LTI user id will be returned as well."

        field :list_avatar_options,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAvatarOption,
          description: "List avatar options. A paginated list of the possible user avatar options that can be set with the user update endpoint. The response will be an array of avatar records. If the 'type' field is 'attachment', the record will include all the normal attachment json fields; otherwise it will include only the 'url' and 'display_name' fields. Additionally, all records will include a 'type' field and a 'token' field. The following explains each field in more detail   type:: ['gravatar'|'attachment'|'no_pic'] The type of avatar record, for categorization purposes.   url:: The url of the avatar   token:: A unique representation of the avatar record which can be used to set the avatar with the user update endpoint. Note: this is an internal representation and is subject to change without notice. It should be consumed with this api endpoint and used in the user update endpoint, and should not be constructed by the client.   display_name:: A textual description of the avatar record   id:: ['attachment' type only] the internal id of the attachment   content-type:: ['attachment' type only] the content-type of the attachment   filename:: ['attachment' type only] the filename of the attachment   size:: ['attachment' type only] the size of the attachment"

        field :list_user_page_views,
          resolver: LMSGraphQL::Resolvers::Canvas::ListUserPageView,
          description: "List user page views. Return a paginated list of the user's page view history in json format,   similar to the available CSV download. Page views are returned in   descending order, newest to oldest."

        field :load_custom_data,
          resolver: LMSGraphQL::Resolvers::Canvas::LoadCustomDatum,
          description: "Load custom data. Load custom user data.      Arbitrary JSON data can be stored for a User.  This API call   retrieves that data for a (optional) given scope.   See {api:UsersController#set_custom_data Store Custom Data} for details and   examples.      On success, this endpoint returns an object containing the data that was requested.      Responds with status code 400 if the namespace parameter, +ns+, is missing or invalid,   or if the specified scope does not contain any data."

        field :list_course_nicknames,
          resolver: LMSGraphQL::Resolvers::Canvas::ListCourseNickname,
          description: "List course nicknames. Returns all course nicknames you have set."

        field :get_course_nickname,
          resolver: LMSGraphQL::Resolvers::Canvas::GetCourseNickname,
          description: "Get course nickname. Returns the nickname for a specific course."

        field :show_single_webhook_subscription,
          resolver: LMSGraphQL::Resolvers::Canvas::ShowSingleWebhookSubscription,
          description: "Show a single Webhook Subscription. "

        field :list_all_webhook_subscription_for_tool_proxy,
          resolver: LMSGraphQL::Resolvers::Canvas::ListAllWebhookSubscriptionForToolProxy,
          description: "List all Webhook Subscription for a tool proxy. This endpoint returns a paginated list with a default limit of 100 items per result set.   You can retrieve the next result set by setting a 'StartKey' header in your next request   with the value of the 'EndKey' header in the response.      Example use of a 'StartKey' header object:     { 'Id':'71d6dfba-0547-477d-b41d-db8cb528c6d1','DeveloperKey':'10000000000001' }"
      end
    end
  end
end