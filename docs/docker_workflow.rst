.. _docker_workflow:

Sample docker setup
===================

This is a sample of using a docker workflow with thiene, JRuby and Rails 6.

Sample docker file
------------------
 - this has user permissions setup for
   `Linux <https://vsupalov.com/docker-shared-permissions/>`_, if you're
   using mac or widows just ditch all the user/group stuff and stick
   with root.
 - Also note that we're not installing our gems when we build the image.
   That way we don't have to rebuild when gems are added. see `this <https://anonoz.github.io/tech/2019/03/10/rails-docker-compose-yml.html>`_ for more detail.
 - Note we install the `screen` and package (and `libreadline-dev`
   , `zlib1g-dev`, `git` if using CRuby).

`Dockerfile JRuby Client <https://gist.github.com/rwilliams/d8fe29e5e39494272cc8b93cf625b4e7/>`_

`Dockerfile CRuby Client <https://gist.github.com/rwilliams/97fd8802133289c4cb70c4a3de0c8a81/>`_

Sample docker-compose.yml
-------------------------

`docker-compose.yml <https://gist.github.com/rwilliams/1c35d3fe8bec7ce1f00480b52dd3921b>`_

Setup
-----
 - Build your image `docker-compose build web`
 - Install gems `docker-compose run web bundle`
 - Create a ``.theine`` file with silent option at your app root
   ``echo "silent: true" > .theine``
 - To use Theine you want to run bash on your web service. ``docker-compose
   run web bash``
 - Run the theine server ``thiene_server &`` - This creates a detached
   theine_server
 - You'll be running all your rails commands from this bash console

Start `using <https://theine2.readthedocs.io/en/latest/#using>`_ Theine
-----------------------------------------------------------------------
 - `theine` will basically replace your `rails` command. So rails routes
   becomes `theine routes`.
 - Migrations would be `theine db:migrate` etc.
 - You should run your web server like normal with ``docker-compose
   up`` but you'll want to use theine for migrations/consoles/rails tasks
   etc

Sample Performance
------------------
``time theine routes`` - CRuby Client
  | real    0m1.854s
  | user    1m25.364s
  | sys     0m9.491s

**vs**

``time theine routes`` - JRuby Client
  | real    0m7.702s
  | user    1m49.563s
  | sys     0m10.085s

**vs**

``time rails routes`` - native JRuby
  | real    0m24.904s
  | user    1m25.817s
  | sys     0m6.146s





