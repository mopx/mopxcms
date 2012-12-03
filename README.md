mopxcms v0.1
================================

A simple Rails starter app configured with a CMS, using Twitter Bootstrap, ActiveAdmin, Devise and CanCan.

This is a very early version, and a work in progress. DO NOT USE THIS ON PRODUCTION!

Testing
-------------------------

<pre>
$ bundle exec rake spec:requests
</pre>

Heroku Instructions
-------------------------

<pre>
$ heroku apps:create name-of-your-app
$ git push heroku master
$ heroku run rake db:migrate && rake db:seed
$ heroku addons:add sendgrid:starter
</pre>