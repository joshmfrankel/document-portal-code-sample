# Teacher Portal

**Production**: https://teacher-markdown-portal.onrender.com/
**Admin Portal** https://teacher-markdown-portal.onrender.com/admin

## Requirements

**Github Project**: [https://github.com/users/joshmfrankel/projects/7/views/1](https://github.com/users/joshmfrankel/projects/7/views/1)

**Pitch Document**: [https://github.com/joshmfrankel/teacher-markdown-portal/blob/main/pitch.md](https://github.com/joshmfrankel/teacher-markdown-portal/blob/main/pitch.md)

This is an architectural document used to organize and plan project decisions. This was copied from the associated Github project which contains all related issues and pull requests.

### MVP
* A way for teachers to sign up and create their accounts
* Document upload and storage
* Display Markdown documents as web pages
* Each file should be accessible on the public web via a unique URL
* Upload and download other types of documents
* Admin interface for us to manage teacher accounts
* Access controls

### Stretch
* Student accounts
* View metrics for documents

### V1
* Folders of files
* Students being able to view a list of files in a folder
* Suggest changes to documents
* Version control
* Revision history
* Multiple simultaneous editors

## Technology used

* ViewComponent - https://viewcomponent.org/
* Devise - https://github.com/heartcombo/devise
* Redcarpet - https://github.com/vmg/redcarpet
* AWS S3 - https://github.com/aws/aws-sdk-ruby
* Stimulus Clipboard - https://www.stimulus-components.com/docs/stimulus-clipboard
* Heroicons - https://github.com/bharget/heroicon
* TailwindCSS - https://github.com/rails/tailwindcss-rails
* Administrate - https://administrate-demo-prerelease.herokuapp.com/getting_started
* Pundit - https://github.com/varvet/pundit
