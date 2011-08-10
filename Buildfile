repositories.remote << 'http://maven.springframework.org/release'
repositories.remote << 'http://repo1.maven.org/maven2'
repositories.remote << 'http://maven.springframework.org/milestone'
repositories.remote << 'https://repository.jboss.org/nexus/content/repositories/releases'

SPRING_VERSION='3.0.5.RELEASE'
ASPECTJ_VERSION='1.6.11.M2'
SLF4J_VERSION='1.6.1'
SPRING_SECURITY_VERSION='3.0.5.RELEASE'

ASPECTJ = Buildr::group('aspectjweaver',
                        'aspectjrt',
                        :under => 'org.aspectj', :version => ASPECTJ_VERSION)

SPRING = Buildr::group('spring-core',
                       'spring-context',
                       'spring-aop',
                       'spring-aspects',
                       'spring-tx',
                       'spring-jdbc',
                       'spring-orm',
                       'spring-web',
                       'spring-webmvc',
                       'spring-context-support',
                       'spring-test',
                       :under => 'org.springframework', :version => SPRING_VERSION)

SPRING_SECURITY = transitive(Buildr::group('spring-security-core',
                                          'spring-security-config',
                                          'spring-security-web',
                                          'spring-security-taglibs',
                                          :under => 'org.springframework.security', :version => SPRING_SECURITY_VERSION)).reject { |a| a.id == 'commons-logging' || a.group == 'org.springframework' }

TILES = Buildr::group('tiles-core',
                      'tiles-jsp',
                      :under => 'org.apache.tiles', :version => '2.2.1')

APACHE_COMMONS = [ 'commons-fileupload:commons-fileupload:jar:1.2.1',
  'commons-digester:commons-digester:jar:2.0',
  'commons-dbcp:commons-dbcp:jar:1.3',
  'commons-lang:commons-lang:jar:2.6',
  'commons-pool:commons-pool:jar:1.5.4' ]

JAVAX = [ 'javax.mail:mail:jar:1.4.1',
  'javax.activation:activation:jar:1.1.1',
  'javax.servlet:jstl:jar:1.2',
  'javax.transaction:jta:jar:1.1',
  'javax.validation:validation-api:jar:1.0.0.GA' ]

HIBERNATE = [ 'org.hibernate.javax.persistence:hibernate-jpa-2.0-api:jar:1.0.0.Final',
  'org.hibernate:hibernate-core:jar:3.6.4.Final' ]

HIBERNATE_VALIDATOR = transitive('org.hibernate:hibernate-validator:jar:4.1.0.Final').reject { |a| a.id == 'jaxb-api' || a.id == 'jaxb-impl' }
HIBERNATE_ENTITYMANAGER = transitive('org.hibernate:hibernate-entitymanager:jar:3.6.4.Final').reject { |a| a.id == 'cglib' || a.id == 'dom4j' }

OTHER_DEPS = [ 'joda-time:joda-time:jar:1.6', 'cglib:cglib-nodep:jar:2.2', 'net.sf.flexjson:flexjson:jar:2.1' ]

DATABASE = struct(
  :mysql => 'mysql:mysql-connector-java:jar:5.1.13',
  :hsqldb => 'org.hsqldb:jar:1.8.0.10'
)

JUNIT = 'junit:junit:jar:4.8.2'

SLF4J = Buildr::group('slf4j-api', 'jcl-over-slf4j', 'slf4j-log4j12', :under => 'org.slf4j', :version => SLF4J_VERSION)

LOG4J = 'log4j:log4j:jar:1.2.16'

FULL_DEPS = [ HIBERNATE_ENTITYMANAGER, HIBERNATE_VALIDATOR, SPRING_SECURITY ] + transitive([ SPRING, HIBERNATE, APACHE_COMMONS, SLF4J, LOG4J, ASPECTJ, TILES, JAVAX, OTHER_DEPS]).reject { |a| a.id == 'commons-logging' }

define 'edify-webapp' do
  project.version = '0.1.0-SNAPSHOT'
  package(:war).with :libs => artifacts(FULL_DEPS)
  compile.with FULL_DEPS
  test.with JUNIT
end

puts project('edify-webapp').compile.dependencies
