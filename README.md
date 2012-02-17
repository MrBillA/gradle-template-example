# What is this?

This is template for Java WebApps using Spring, JPA (Hibernate), Spring Data JPA and SpringSecurity

# What does it include?

The template includes:

* Basic Spring configuration for both backend and web tier
* JPA configuration with a Hibernate backend
* Spring Data JPA configuration
* SpringSecurity configuration
* Tiles2 configuration
* Exception pages (DataAccessFailure, ResourceNotFound, UncaughtException)
* A propose dir layout for the view tier
* Spring mail sender configuration
* Spring theme support configuration
* Spring i18n configuration
* A basic layout using Tiles2
* Logging support using slf4j with logback backend
* Basic logback configuration

# Versions

* Spring                   3.1.1.RELEASE
* Spring Security          3.1.0.RELEASE
* Hibernate Core           4.1.0.Final
* Hibernate Entity Manager 4.1.0.Final
* SLF4J                    1.6.4
* Logback                  1.0.0
* Tiles                    2.2.2   
* MySQL Connector          5.1.18

For a full list look at the build.gradle file

# Requirements

## For backend development

[gradle](http://www.gradle.org/)

    > brew install gradle

## For frontend development (less, javascript, css)

[coffeescript](http://coffeescript.org/)

    OSX> brew install coffee-script

    UBUNTU-11-10> sudo apt-get install nodejs npm &&
                  sudo npm install coffee-script

[guard](https://github.com/guard/guard)

    > gem install guard

[guard-less](https://github.com/guard/guard-less)

    > gem install guard-less

# Usage

To start a new Java project based on this template simple clone it (yeah is that easy!)

    > git clone git@github.com:edify/java-spring-jpa-template.git your_app_name
    > rm -rf .git
    > git init
    > git commit -a "Initial Commit"

Change the following in the web.xml file:

    <context-param>
       <param-name>webAppRootKey</param-name>
       <param-value>edify.root</param-value>
    </context-param>

    <display-name>edify-java-spring-jpa-template</display-name>
    <description>Edify Java Spring JPA WebApp Template</description>

    <servlet-name>edify</servlet-name>

Change the following in build.gradle

    group = 'change.me'
    projectName = 'changeme'

Change the follwing in gradle.properties

    logbackSyslogPort=20159 # To the proper port if you are using loggly or any other syslog server
    logbackSyslogHost=logs.loggly.com # To the proper syslog server if you are using syslog
    
Change in spring application context XML files

    change.me # To the proper package name

Test the app

    > gradle tomcatRun

Open [http://0.0.0.0:8080/](http://0.0.0.0:8080/) and you should see a nice **Hello World!**

# Development tasks

Compiling Less and CoffeeScript files:

    > guard

This would check changes on the less files and recompile them to CSS and keep watching until CTRL-C

Compressing CSS and Javascript:

    > gradle compressCss
    > gradle compressJs

or

    > gradle compressAll

Compiling Less manually:

    > gradle compileLess

Compiling CoffeeScript manually:

    > gradle compileCoffeScript

Optional if you have foreman gem install

    > foreman start

This would start _gradle tomcatRun_ and _guard_ in a single terminal

# JRebel

To use [JRebel](http://zeroturnaround.com/jrebel/)

* Install JRebel [http://zeroturnaround.com/jrebel/current/](http://zeroturnaround.com/jrebel/current/)
* Set REBEL_HOME to the JRebel install dir (/Applications/ZeroTurnaround/JRebel in OSX)
* Set GRADLE_OPTS="-javaagent:$REBEL_HOME/jrebel.jar -Drebel.log4j-plugin=false $JAVA_OPTS"

Then simply start tomcat with

    > gradle tomcatRun

# TODO

* Keep checking dependencies versions and update them when necessary.
* Add any missing dependencies if needed

# LICENSE:

Copyright (c) 2011 Julio Arias, Edify Software Consulting Ltda.

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
