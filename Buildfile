require 'buildr/ivy_extension'
require 'buildr/jetty'

define 'edify-webapp', :version => '0.1.0-SNAPSHOT' do
  ivy.compile_conf('compile')
  ivy.package_conf('compile')
  ivy.test_conf(['compile', 'test'])
  compile.using(:target => '1.6')
  package(:war)

  task('jetty' => [ package(:war), jetty.use ]) do |task|
    jetty.deploy("http://localhost:8080", task.prerequisites.first)
    Java.classpath.concat([ "org.mortbay.jetty:jsp-api-2.1:jar:#{Buildr::Jetty::VERSION}", 
                            "org.mortbay.jetty:jsp-2.1:jar:#{Buildr::Jetty::VERSION}" ]) 
    puts 'Press CTRL-C to stop Jetty'
    trap 'SIGINT' do
      jetty.stop
    end
    Thread.stop
  end
end

