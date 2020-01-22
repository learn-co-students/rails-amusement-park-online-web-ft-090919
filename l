
Feature Test: User Signup
  successfully signs up as non-admin
  on sign up, successfully adds a session hash
  successfully logs in as non-admin
  on log in, successfully adds a session hash
  prevents user from viewing user show page and redirects to home page if not logged in (FAILED - 1)
  successfully signs up as admin (FAILED - 2)
  on sign up for admin, successfully adds a session hash (FAILED - 3)
  successfully logs in as admin (FAILED - 4)
  on log in, successfully adds a session hash to admins (FAILED - 5)

Feature Test: User Signout
  has a link to log out from the users/show page
  redirects to home page after logging out (FAILED - 6)
  successfully destroys session hash when 'Log Out' is clicked (FAILED - 7)
  has a link to log out from the users/show page when user is an admin (FAILED - 8)
  redirects to home page after admin logs out when user is an admin (FAILED - 9)
  successfully destroys session hash when 'Log Out' is clicked as admin (FAILED - 10)

Feature Test: Go on a Ride
  has a link from the user show page to the attractions index page (FAILED - 11)
  links from the user show page to the attractions index page (FAILED - 12)
  prevents users from editing/deleting/adding rides on the index page (FAILED - 13)
  has titles of the rides on the attractions index page (FAILED - 14)
  has links on the attractions index page to the attractions' show pages (FAILED - 15)
  links from the attractions index page to the attractions' show pages (FAILED - 16)
  prevents users from editing/deleting a ride on the show page (FAILED - 17)
  has a button from the attraction show page to go on the ride (FAILED - 18)
  clicking on 'Go on ride' redirects to user show page (FAILED - 19)
  clicking on 'Go on ride' updates the users ticket number (FAILED - 20)
  clicking on 'Go on ride' updates the users mood (FAILED - 21)
  when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message (FAILED - 22)
  when the user is too short, clicking on 'Go on ride' displays a sorry message (FAILED - 23)
  when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message (FAILED - 24)
  when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message (FAILED - 25)

Feature Test: Admin Flow
  displays admin when logged in as an admin on user show page (FAILED - 26)
  links to the attractions from the users show page when logged in as a admin (FAILED - 27)
  has a link from the user show page to the attractions index page when in admin mode (FAILED - 28)
  allows admins to add an attraction from the index page (FAILED - 29)
  allows admins to add an attraction (FAILED - 30)
  has link to attraction/show from attraction/index page for admins (FAILED - 31)
  does not suggest that admins go on a ride (FAILED - 32)
  links to attractions/show page from attractions/index (FAILED - 33)
  does not suggest that an admin go on a ride from attractions/show page (FAILED - 34)
  has a link for admin to edit attraction from the attractions/show page (FAILED - 35)
  links to attraction/edit page from attraction/show page when logged in as an admin (FAILED - 36)
  updates an attraction when an admin edits it (FAILED - 37)

Attraction
  is valid with a name, min_height, nausea_rating, happiness_rating, and ticket number
  has many rides
  has many users through rides

Ride
  is valid with a user_id and a attraction_id
  belongs to one attraction
  belongs to one user
  has a method 'take_ride' that accounts for the user not having enough tickets
  has a method 'take_ride' that accounts for the user not being tall enough
  has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
  has a method 'take_ride' that updates ticket number
  has a method 'take_ride' that updates the user's nausea
  has a method 'take_ride' that updates the user's happiness

User
  is valid with a name, password, happiness, nausea, height, and tickets
  is not valid without a password
  is valid with an admin boolean
  defaults to admin => false
  has many rides
  has many attractions through rides
  has a method 'mood' that returns 'sad' when the user is more nauseous than happy
  has a method 'mood' that returns 'happy' when the user is more happy than nauseous

Failures:

  1) Feature Test: User Signup prevents user from viewing user show page and redirects to home page if not logged in
     Failure/Error: expect(page).to have_content("Sign Up")
       expected to find text "Sign Up" in "Toggle navigation Home Login Signup Welcome!"
     # ./spec/features/users_features_spec.rb:51:in `block (2 levels) in <top (required)>'

  2) Feature Test: User Signup successfully signs up as admin
     Failure/Error: nausea > happiness ? 'sad' : 'happy'

     ActionView::Template::Error:
       undefined method `>' for nil:NilClass
     # ./app/models/user.rb:7:in `mood'
     # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/support/login_helper.rb:23:in `admin_signup'
     # ./spec/features/users_features_spec.rb:58:in `block (2 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # NoMethodError:
     #   undefined method `>' for nil:NilClass
     #   ./app/models/user.rb:7:in `mood'

  3) Feature Test: User Signup on sign up for admin, successfully adds a session hash
     Failure/Error: nausea > happiness ? 'sad' : 'happy'

     ActionView::Template::Error:
       undefined method `>' for nil:NilClass
     # ./app/models/user.rb:7:in `mood'
     # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/support/login_helper.rb:23:in `admin_signup'
     # ./spec/features/users_features_spec.rb:67:in `block (2 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # NoMethodError:
     #   undefined method `>' for nil:NilClass
     #   ./app/models/user.rb:7:in `mood'

  4) Feature Test: User Signup successfully logs in as admin
     Failure/Error: nausea > happiness ? 'sad' : 'happy'

     ActionView::Template::Error:
       undefined method `>' for nil:NilClass
     # ./app/models/user.rb:7:in `mood'
     # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/support/login_helper.rb:29:in `admin_login'
     # ./spec/features/users_features_spec.rb:76:in `block (2 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # NoMethodError:
     #   undefined method `>' for nil:NilClass
     #   ./app/models/user.rb:7:in `mood'

  5) Feature Test: User Signup on log in, successfully adds a session hash to admins
     Failure/Error: nausea > happiness ? 'sad' : 'happy'

     ActionView::Template::Error:
       undefined method `>' for nil:NilClass
     # ./app/models/user.rb:7:in `mood'
     # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/support/login_helper.rb:29:in `admin_login'
     # ./spec/features/users_features_spec.rb:86:in `block (2 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # NoMethodError:
     #   undefined method `>' for nil:NilClass
     #   ./app/models/user.rb:7:in `mood'

  6) Feature Test: User Signout redirects to home page after logging out
     Failure/Error: click_link("Log Out")

     Capybara::ElementNotFound:
       Unable to find visible link "Log Out"
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/features/users_features_spec.rb:105:in `block (2 levels) in <top (required)>'

  7) Feature Test: User Signout successfully destroys session hash when 'Log Out' is clicked
     Failure/Error: click_link("Log Out")

     Capybara::ElementNotFound:
       Unable to find visible link "Log Out"
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/features/users_features_spec.rb:113:in `block (2 levels) in <top (required)>'

  8) Feature Test: User Signout has a link to log out from the users/show page when user is an admin
     Failure/Error: nausea > happiness ? 'sad' : 'happy'

     ActionView::Template::Error:
       undefined method `>' for nil:NilClass
     # ./app/models/user.rb:7:in `mood'
     # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/support/login_helper.rb:23:in `admin_signup'
     # ./spec/features/users_features_spec.rb:120:in `block (2 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # NoMethodError:
     #   undefined method `>' for nil:NilClass
     #   ./app/models/user.rb:7:in `mood'

  9) Feature Test: User Signout redirects to home page after admin logs out when user is an admin
     Failure/Error: nausea > happiness ? 'sad' : 'happy'

     ActionView::Template::Error:
       undefined method `>' for nil:NilClass
     # ./app/models/user.rb:7:in `mood'
     # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
     # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
     # ./spec/support/login_helper.rb:23:in `admin_signup'
     # ./spec/features/users_features_spec.rb:127:in `block (2 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # NoMethodError:
     #   undefined method `>' for nil:NilClass
     #   ./app/models/user.rb:7:in `mood'

  10) Feature Test: User Signout successfully destroys session hash when 'Log Out' is clicked as admin
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:135:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  11) Feature Test: Go on a Ride has a link from the user show page to the attractions index page
      Failure/Error: expect(page).to have_content("See attractions")
        expected to find text "See attractions" in "Toggle navigation Home Amy Poehler's profile Log Out Name: Amy Poehler Tickets: 15 Mood: happy Height: 58"
      # ./spec/features/users_features_spec.rb:170:in `block (2 levels) in <top (required)>'

  12) Feature Test: Go on a Ride links from the user show page to the attractions index page
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:175:in `block (2 levels) in <top (required)>'

  13) Feature Test: Go on a Ride prevents users from editing/deleting/adding rides on the index page
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:180:in `block (2 levels) in <top (required)>'

  14) Feature Test: Go on a Ride has titles of the rides on the attractions index page
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:188:in `block (2 levels) in <top (required)>'

  15) Feature Test: Go on a Ride has links on the attractions index page to the attractions' show pages
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:194:in `block (2 levels) in <top (required)>'

  16) Feature Test: Go on a Ride links from the attractions index page to the attractions' show pages
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:200:in `block (2 levels) in <top (required)>'

  17) Feature Test: Go on a Ride prevents users from editing/deleting a ride on the show page
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:206:in `block (2 levels) in <top (required)>'

  18) Feature Test: Go on a Ride has a button from the attraction show page to go on the ride
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:213:in `block (2 levels) in <top (required)>'

  19) Feature Test: Go on a Ride clicking on 'Go on ride' redirects to user show page
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:220:in `block (2 levels) in <top (required)>'

  20) Feature Test: Go on a Ride clicking on 'Go on ride' updates the users ticket number
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:227:in `block (2 levels) in <top (required)>'

  21) Feature Test: Go on a Ride clicking on 'Go on ride' updates the users mood
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:234:in `block (2 levels) in <top (required)>'

  22) Feature Test: Go on a Ride when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:241:in `block (2 levels) in <top (required)>'

  23) Feature Test: Go on a Ride when the user is too short, clicking on 'Go on ride' displays a sorry message
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:250:in `block (2 levels) in <top (required)>'

  24) Feature Test: Go on a Ride when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:260:in `block (2 levels) in <top (required)>'

  25) Feature Test: Go on a Ride when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message
      Failure/Error: click_link('See attractions')

      Capybara::ElementNotFound:
        Unable to find visible link "See attractions"
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:314:in `block in synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:302:in `synced_resolve'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/finders.rb:37:in `find'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:43:in `click_link'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/features/users_features_spec.rb:270:in `block (2 levels) in <top (required)>'

  26) Feature Test: Admin Flow displays admin when logged in as an admin on user show page
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  27) Feature Test: Admin Flow links to the attractions from the users show page when logged in as a admin
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  28) Feature Test: Admin Flow has a link from the user show page to the attractions index page when in admin mode
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  29) Feature Test: Admin Flow allows admins to add an attraction from the index page
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  30) Feature Test: Admin Flow allows admins to add an attraction
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  31) Feature Test: Admin Flow has link to attraction/show from attraction/index page for admins
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  32) Feature Test: Admin Flow does not suggest that admins go on a ride
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  33) Feature Test: Admin Flow links to attractions/show page from attractions/index
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  34) Feature Test: Admin Flow does not suggest that an admin go on a ride from attractions/show page
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  35) Feature Test: Admin Flow has a link for admin to edit attraction from the attractions/show page
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  36) Feature Test: Admin Flow links to attraction/edit page from attraction/show page when logged in as an admin
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

  37) Feature Test: Admin Flow updates an attraction when an admin edits it
      Failure/Error: nausea > happiness ? 'sad' : 'happy'

      ActionView::Template::Error:
        undefined method `>' for nil:NilClass
      # ./app/models/user.rb:7:in `mood'
      # ./app/views/users/show.html.erb:3:in `_app_views_users_show_html_erb___2492726419526651383_47227074945480'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack_session_access-0.2.0/lib/rack_session_access/middleware.rb:33:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/tempfile_reaper.rb:17:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/etag.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/conditional_get.rb:27:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/head.rb:14:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:277:in `context'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/session/abstract/id.rb:271:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:38:in `call_app'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/rack/logger.rb:26:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/method_override.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/runtime.rb:24:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/sendfile.rb:113:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/railties-5.2.4.1/lib/rails/engine.rb:524:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:77:in `block in call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `each'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-2.1.1/lib/rack/urlmap.rb:61:in `call'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:69:in `process'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:44:in `block in process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `times'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:43:in `process_and_follow_redirects'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/browser.rb:32:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/form.rb:80:in `submit'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/rack_test/node.rb:64:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `block in click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/base.rb:85:in `synchronize'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/element.rb:143:in `click'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/node/actions.rb:61:in `click_button'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/session.rb:808:in `block (2 levels) in <class:Session>'
      # /home/clone/.rvm/gems/ruby-2.6.1/gems/capybara-2.18.0/lib/capybara/dsl.rb:50:in `block (2 levels) in <module:DSL>'
      # ./spec/support/login_helper.rb:23:in `admin_signup'
      # ./spec/features/users_features_spec.rb:304:in `block (2 levels) in <top (required)>'
      # ------------------
      # --- Caused by: ---
      # NoMethodError:
      #   undefined method `>' for nil:NilClass
      #   ./app/models/user.rb:7:in `mood'

Finished in 1.21 seconds (files took 0.63006 seconds to load)
62 examples, 37 failures

Failed examples:

rspec ./spec/features/users_features_spec.rb:47 # Feature Test: User Signup prevents user from viewing user show page and redirects to home page if not logged in
rspec ./spec/features/users_features_spec.rb:54 # Feature Test: User Signup successfully signs up as admin
rspec ./spec/features/users_features_spec.rb:64 # Feature Test: User Signup on sign up for admin, successfully adds a session hash
rspec ./spec/features/users_features_spec.rb:71 # Feature Test: User Signup successfully logs in as admin
rspec ./spec/features/users_features_spec.rb:82 # Feature Test: User Signup on log in, successfully adds a session hash to admins
rspec ./spec/features/users_features_spec.rb:101 # Feature Test: User Signout redirects to home page after logging out
rspec ./spec/features/users_features_spec.rb:109 # Feature Test: User Signout successfully destroys session hash when 'Log Out' is clicked
rspec ./spec/features/users_features_spec.rb:117 # Feature Test: User Signout has a link to log out from the users/show page when user is an admin
rspec ./spec/features/users_features_spec.rb:124 # Feature Test: User Signout redirects to home page after admin logs out when user is an admin
rspec ./spec/features/users_features_spec.rb:132 # Feature Test: User Signout successfully destroys session hash when 'Log Out' is clicked as admin
rspec ./spec/features/users_features_spec.rb:169 # Feature Test: Go on a Ride has a link from the user show page to the attractions index page
rspec ./spec/features/users_features_spec.rb:174 # Feature Test: Go on a Ride links from the user show page to the attractions index page
rspec ./spec/features/users_features_spec.rb:179 # Feature Test: Go on a Ride prevents users from editing/deleting/adding rides on the index page
rspec ./spec/features/users_features_spec.rb:187 # Feature Test: Go on a Ride has titles of the rides on the attractions index page
rspec ./spec/features/users_features_spec.rb:193 # Feature Test: Go on a Ride has links on the attractions index page to the attractions' show pages
rspec ./spec/features/users_features_spec.rb:199 # Feature Test: Go on a Ride links from the attractions index page to the attractions' show pages
rspec ./spec/features/users_features_spec.rb:205 # Feature Test: Go on a Ride prevents users from editing/deleting a ride on the show page
rspec ./spec/features/users_features_spec.rb:212 # Feature Test: Go on a Ride has a button from the attraction show page to go on the ride
rspec ./spec/features/users_features_spec.rb:219 # Feature Test: Go on a Ride clicking on 'Go on ride' redirects to user show page
rspec ./spec/features/users_features_spec.rb:226 # Feature Test: Go on a Ride clicking on 'Go on ride' updates the users ticket number
rspec ./spec/features/users_features_spec.rb:233 # Feature Test: Go on a Ride clicking on 'Go on ride' updates the users mood
rspec ./spec/features/users_features_spec.rb:240 # Feature Test: Go on a Ride when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message
rspec ./spec/features/users_features_spec.rb:247 # Feature Test: Go on a Ride when the user is too short, clicking on 'Go on ride' displays a sorry message
rspec ./spec/features/users_features_spec.rb:257 # Feature Test: Go on a Ride when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message
rspec ./spec/features/users_features_spec.rb:267 # Feature Test: Go on a Ride when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message
rspec ./spec/features/users_features_spec.rb:307 # Feature Test: Admin Flow displays admin when logged in as an admin on user show page
rspec ./spec/features/users_features_spec.rb:311 # Feature Test: Admin Flow links to the attractions from the users show page when logged in as a admin
rspec ./spec/features/users_features_spec.rb:315 # Feature Test: Admin Flow has a link from the user show page to the attractions index page when in admin mode
rspec ./spec/features/users_features_spec.rb:322 # Feature Test: Admin Flow allows admins to add an attraction from the index page
rspec ./spec/features/users_features_spec.rb:327 # Feature Test: Admin Flow allows admins to add an attraction
rspec ./spec/features/users_features_spec.rb:341 # Feature Test: Admin Flow has link to attraction/show from attraction/index page for admins
rspec ./spec/features/users_features_spec.rb:346 # Feature Test: Admin Flow does not suggest that admins go on a ride
rspec ./spec/features/users_features_spec.rb:351 # Feature Test: Admin Flow links to attractions/show page from attractions/index
rspec ./spec/features/users_features_spec.rb:357 # Feature Test: Admin Flow does not suggest that an admin go on a ride from attractions/show page
rspec ./spec/features/users_features_spec.rb:363 # Feature Test: Admin Flow has a link for admin to edit attraction from the attractions/show page
rspec ./spec/features/users_features_spec.rb:369 # Feature Test: Admin Flow links to attraction/edit page from attraction/show page when logged in as an admin
rspec ./spec/features/users_features_spec.rb:376 # Feature Test: Admin Flow updates an attraction when an admin edits it

