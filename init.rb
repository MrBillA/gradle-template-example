#!/usr/bin/env ruby

require 'optparse'
require 'fileutils'

options = {:dry => false}

opts = OptionParser.new do |opt|
  opt.banner = "Usage: init.rb -g GITHUB_REPO_URL -b BASE_PACKAGE"

  opt.on('-g', '--github REPO', 'The project GitHub repository') do |repo|
    options[:repo] = repo
  end

  opt.on('-b', '--basepkg BASE_PACKAGE', 'The project base package') do |bpkg|
    options[:basepkg] = bpkg
  end

  opt.on('-n', '--name PROJECT_NAME', 'The project name') do |name|
    options[:name] = name
  end

  opt.on('-d', '', 'Dry run (don\'t commit changes)') do |name|
    options[:dry] = true
  end
end

opts.parse!

begin
  p opts
  exit 1
end unless options[:repo] || options[:basepkg] || options[:name]

# Replace the project name
p "[0;32m===> Replacing changeme for project name [#{options[:name]}][m"
`sed -i .bak -e 's/changeme.root/#{options[:name]}.root/g' src/main/webapp/WEB-INF/web.xml`
`sed -i .bak -e 's/changeme.log/#{options[:name]}.log/g' src/main/resources/logback.xml`
`sed -i .bak -e 's/changeme.%i.log.zip/#{options[:name]}.%i.log.zip/g' src/main/resources/logback.xml`
`sed -i .bak -e 's/file:%s\\/.gradle\\/changeme.properties/file:%s\\/.gradle\\/#{options[:name]}.properties/g' src/main/java/com/edify/config/ApplicationConfig.java`

# Replace the base package
p "[0;32m===> Replacing com.edify for project base package [#{options[:basepkg]}][m"
`sed -i .bak -e 's/group = "com.edify"/group = "#{options[:basepkg]}"/g' build.gradle`
`sed -i .bak -e 's/com.edify/#{options[:basepkg]}/g' src/main/java/com/edify/config/ApplicationConfig.java`
`sed -i .bak -e 's/com.edify/#{options[:basepkg]}/g' src/main/java/com/edify/model/User.java`
`sed -i .bak -e 's/com.edify/#{options[:basepkg]}/g' src/main/java/com/edify/config/WebConfig.java`
`sed -i .bak -e 's/com.edify/#{options[:basepkg]}/g' src/main/java/com/edify/web/servlet/EnvironmentInterceptor.java`
`sed -i .bak -e 's/com.edify/#{options[:basepkg]}/g' src/main/resources/META-INF/spring/applicationContext-repositories.xml`
`sed -i .bak -e 's/com.edify/#{options[:basepkg]}/g' src/main/webapp/WEB-INF/web.xml`

p "[0;32m===> Moving everything to the new base package [#{options[:basepkg]}][m"
project_base_pkg_dir = "src/main/java/#{options[:basepkg].gsub('.', '/')}"

FileUtils.mkdir_p project_base_pkg_dir
FileUtils.mv "src/main/java/com/edify/model", project_base_pkg_dir
FileUtils.mv "src/main/java/com/edify/config", project_base_pkg_dir
FileUtils.mv "src/main/java/com/edify/web", project_base_pkg_dir

FileUtils.rm_rf "src/main/java/com/edify"

begin
  p "[0;32m===> Creating first commit[m"
  `git add -au .`
  `git commit -m "#{options[:name] initial commit}"`
  p "[0;32m===> Changing origin url to [#{options[:repo]}][m"
  `git remote set-url origin #{options[:repo]}`
end unless options[:dry]

p "All done!!\n\n Now just 'git push'"
