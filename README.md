# What is this?

This is template for Java WebApps using Spring, JPA (Hibernate), Spring Data JPA and SpringSecurity

# What does it include?

The template includes:

* Basic Spring configuration for both backend and web tier
* JPA configuration with a Hibernate backend
* Spring Data JPA configuration
* SpringSecurity configuration
* Sitemesh 2 configuration
* Exception pages (DataAccessFailure, ResourceNotFound, UncaughtException)
* A propose dir layout for the view tier
* Spring mail sender configuration
* Spring theme support configuration
* Spring i18n configuration
* A basic layout using Sitemesh 2
* Logging support using slf4j with logback backend
* Basic logback configuration

# Versions

* Spring                   3.1.2.RELEASE
* Spring Security          3.1.1.RELEASE
* Hibernate Core           4.1.5.Final
* Hibernate Entity Manager 4.1.5.Final
* SLF4J                    1.6.6
* Logback                  1.0.6
* Sitemesh                 2.4.2   
* PostgreSQL               9.1-901.jdbc4
* Liquibase                2.0.4

For a full list look at the build.gradle file

# Requirements

None.

To run gradle use the gradel wrapper, to run any task

    > ./gradlew TASK
    
More info about the gradle wrapper [http://gradle.org/docs/current/userguide/gradle_wrapper.html](http://gradle.org/docs/current/userguide/gradle_wrapper.html)

# Usage

To start a new Java project based on this template simple clone it (yeah is that easy!)

    > git clone git@github.com:edify/java-spring-jpa-template.git your_app_name
    > cd your_app_name
    > ./init.rb -n your_app_name -b your_app_base_package -g git@github.com:edify/your_app_base_repo.git

Test the app

    > ./gradlew tomcatRun

or

    > ./gradlew jettyRun

Open [http://0.0.0.0:8080/your_app_name](http://0.0.0.0:8080/your_app_name) and you should see a nice **Hello World!** page

# Development tasks

Compiling Less manually:

    > ./gradlew compileLess

Liquibase tasks:

* [generateChangelog](http://www.liquibase.org/manual/updatedatabase_ant_task)
* [updateDatabase](http://www.liquibase.org/manual/updatedatabase_ant_task)
* [tagDatabase](http://www.liquibase.org/manual/tagdatabase_ant_task)
* [rollbackDatabase](http://www.liquibase.org/manual/rollbackdatabase_ant_task)
* [dbDoc](http://www.liquibase.org/manual/dbdoc_ant_task)

Liquibase updates the database at startup but you can do it manually using the tasks above.

Always use the generateChangelog taks to create a new changelog this task also adds the include

# TODO

* Keep checking dependencies versions and update them when necessary.
* Add any missing dependencies if needed

# LICENSE:

Copyright (c) 2011, 2012 Julio Arias, Edify Software Consulting Ltda.

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
