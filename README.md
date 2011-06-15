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
* Logging support using slf4j with log4j backend
* Basic log4j configuration

# Usage

To start a new Java project based on this template simple clone it (yeah is that easy!)

    > git clone git@github.com:edify/java-spring-jpa-template.git -o template your_app_name

Change the artifactId and groupId in the pom.xml and in any Spring configuration, code your app, commit and push to your app GitHub repo and that's it (Don't push to the template repo if you do you would be in trouble!).

Also change the following in the web.xml file:

    <context-param>
       <param-name>webAppRootKey</param-name>
       <param-value>edify.root</param-value>
    </context-param>

    <display-name>edify-java-spring-jpa-template</display-name>
    <description>Edify Java Spring JPA WebApp Template</description>

    <servlet-name>edify</servlet-name>

Want to test all the config is OK

    > mvn jetty:run

Open [http://0.0.0.0:8080/edify](http://0.0.0.0:8080/edify) and you should see a nice **Hello World!**

# TODO

* Keep checking dependencies versions and update them when necessary.
* Create a small terminal script (Ruby!) that changes the artifactId and groupId, etc.
* Add any missing dependencies if needed
* Change the datasource config from commons-dbcp to c3p0
* Add jQuery to the default jspx template?
* Create a new template for a similar stack but with Flex frontend

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