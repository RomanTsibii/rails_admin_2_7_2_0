# CHANGELOG [example]

The file contains important changes from version to version

## v0.1.3 - UNRELEASED

### Added

* Add api docs for Comment actions
* Add api docs for User actions
* Add api docs for Article actions
* Add rspec api documentation
* Add a checking on the owner of the comment
* Add policy to API
* Add validation to attachment
* Add AWS S3 bucket.
* Add test for validating data
* Created action registration
* Add route logout. Edit login response
* Add jwt token
* Add Blueprint create actions to Articles and Comments
* Add devise jwt
* Started add api.
* Adds test rspec.
* Adds I18N
* Adds JQuery and Edit views article
* Adds Bootstrap
* Create rspec for Comments operations
* Create rspec for Article operations
* Create possibility attaching image to Action Text
* Create Comments destroy action
* Add Comment update action
* Add Comments controller with create action
* Adds pandit and passpartu
* Add Destroy action to Article
* Adds action Create and update to Articles controller
* Adds alert and nokogiri
* Adds mailjet and RCreds
* Create Comment model
* Adds Users and action text to article
* Adds fields to model Article
* Adds rails_admin and model article
* Initial commit

### Changed

* Updated CHANGELOG file
* Fixed issues with not existing article during update article.
* Edit api response for create update articles
* Edit error massages
* Change controller name to users controller.
* Edited routes.
* Edit Article form
* Edit rails admin config
* Edit setting JQuery and add modal for see article content
* Edit navbar and alert
* Changed Comment create action
* Change database name
* Change article show page

### Fixed

* Fixed Article update action

### Deleted

* Remove devise jwt

### Commands to run

* rake docs:generate
* EDITOR=nano rails credentials:edit --environment development 
* RAILS_ENV=production bundle exec rake webpacker:compile
* RAILS_ENV=production bundle exec rake assets:precompile
* ./bin/webpack
