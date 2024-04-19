# Problem

Teachers would like a website that allows them to share their documents with their students. Since teachers utilize Markdown documents primarily, they'll want to share them out using multiple flows.

# Appetite

**MVP**: 10 hours
* Teacher sign up
* Document upload and storage
* Render markdown as web pages
* File public accessibility via unique url
* Admin interface

**Stretch goals**
* Student accounts (is in MVP)
* Access Control (is in MVP through implicit document access)
* View Metrics

**v1.0**: Two weeks
* Suggest changes to documents
* Revision History
* Access Control 2.0
* Version Control

**v2.0**: Two weeks
* Folders of documents with listing
* Multiple editors
* Cleanup

We're looking to deliver the maximum value with the least amount of effort for the MVP release. For the MVP, we will spend 10 hours of implementation time, releasing a proof-of-concept product.  

The future of the project past MVP will classified as two small batch projects.  This will allow time for enhancements, bug fixes, and test coverage. Depending on complexity, the small batch projects can be condensed into one.

# Solution

We'll utilize Ruby on Rails with Hotwire and TailwindCSS for moving quickly through the MVP solution. PostgreSQL will be configured for our database.

Our data model will consist of the following tables

**Documents**
* belongs_to :uploader
* has_one_attached :file

**User**
* has_many :students
* belongs_to :creator
* role column to control teacher to student accounts

**Teacher signup & auth**
The devise gem will be utilized for allowing teachers to sign up and authenticate into their accounts. /sign_up and /sign_in. 

**Admin management interface**
We will utilize the adminstrate gem with the http_basic_authenticate_with strategy to allow simple access via EnvVar that are set. admin/sign_in

**Documents**

Documents will be allowed to upload via ActiveStorage using s3 to host public urls. Any document type will be available for download, but only Markdown will be rendered as HTML using the redcarpet gem.

Once authenticated, teachers will be able to upload documents to their portal. Teachers can share documents using a unique url which will be generated from a stored uuid on the Document. This URL is accessible by unauthenticated users via a public route. 

Additionally, any Students that a Teacher creates will have implicit permission to view any of their documents. This is in addition to the above shareable url.

**Authorization**

The User model will have a role column which can be either `student` or `teacher`. Teachers have the ability to create new student accounts as well as manage their documents.

Students can only manage their own documents. They cannot create more students nor can they modify a Document they are not the owner of. By allowing students to upload documents they could in theory upload answers and/or code solutions to their teachers. Note that this functionality doesn't currently exist for Teachers to be able to see their student's Documents. It would be an easy change given the current configuration.

# Rabbit Holes

**Student Accounts**
These introduce several interesting questions into the project. Do we need two login in pages? (e.g. Teachers and Students). How will students be granted accounts, since we allow Teachers to self-sign up? What resources and documents can a given student access? Will teachers need to grant students access to documents, folders, etc? Should these be classified under a new concept, such as Classes or Courses? That way each student could be given a membership to a Course which gives them access to all documents within the Course. This may all refer to the "access controls" feature request. For access control the Pundit gem will be utilized to provide simple authorization actions and scopes.

# No Gos

**Folders**
Folders are optional for Documents and can be used to organize uploaded files. Folders will use a similiar mechanism to share their folder location as do documents. For the purpose of the MVP, folders will be saved for a later iteration to deliver value to customer faster.

Folders would require a new table and relationship between User and Document.

Folders
* has_many :documents
* belongs_to :user

**UUID**
Using uuid instead of sequential integers is more secure. For the purpose of this project, we will defer uuid usage until necessary. UUID will be utilized for Documents shareable id.

**Granular access control**
Currently there is basic access control in that, a Teacher's students have implicit access to all Documents that the Teacher has uploaded. This relationship is modeled by using a `creator_id` on the User table. For future use-cases like students that are managed by multiple Teachers a join table would be necessary.

User
* has_many :students

UserStudents
* teacher_id - references User
* student_id - also references User

It may prove worthwhile at this point to separate the concept of Student and Teacher into separate models.

For access control with documents, giving Teachers a UI option for explitcly adding individual students one at a time or in bulk would be useful. This would allow more flexible sharing of Documents for Students with accounts.

**Super Admin Accounts**
Best practice for admin portal would be separate records for allowing admins to authenticate. For the purposes of the MVP, we will utilize a simple http_basic_authenticate_with strategy which will give simple access. These are configured via EnvVars. 

A simple data model for persistent admin might contain the following:

AdminUser
* email
* password

**Two-factor Auth**
Two-factor authentication is best practice for both login and admin interfaces. We will not be adding it in the version of the product

**Version Control, revision history, multiple editors, suggest changes**
Each of these features depending on end deliverable could be a significant amount of time to implement fully. Version control and revision history would require a gem such a papertrail along with UI options to see history of a file. Additionally, being able to rollback a version to a previous one would need to be implemented. Other questions arise from this, which are: Do we need to notify students of the change in the document? What about other editors? If I rollback what happens to previously suggest changes records? A simple version of this could be adding a new `state` to Documents to allow for draft or published status.

Multiple simultaneous editors takes document upload into editing feature space. Teachers would now be able to edit the markdown directly and have it save. Additionally, if two or more teachers were on the same page seeing live updates would be facilitated through Hotwire specifically turbo streams. These use Websockets under the hood for live changes. 

Suggest changes would be similar to how a platform like Google Docs works. Teachers (or potentially students) could highlight a section of text and click a button to add a comment or change. This would then be held in moderation until the Teacher approved it. There would need to be a moderation and approval flow, as well as a data model supporting attached comments to a Document text location.

All of the above would require thinking through the user experience, as well as considering how the data structure would interact with the front-end. For these reasons, these are better suited as enhancements to the initial project deliverable once initial MVP value is confirmed.
