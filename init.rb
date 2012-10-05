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

  opt.on('-d', '', 'Dry run (don\'t commit changes)') do
    options[:dry] = true
  end
end

opts.parse!

begin
  puts opts
  exit 1
end unless options[:repo] || options[:basepkg] || options[:name]

# Replace the project name
puts "\e[0;32m===> Replacing changeme for project name [#{options[:name]}]\e[m"
`sed -i .bak -e 's/java_template/#{options[:name]}/g' gradle.properties`
`sed -i .bak -e 's/java/#{options[:name]}/g' gradle.properties`
`find src/main -type f \\( ! -iname "*.png" \\) -exec sed -i .bak -e 's/changeme/#{options[:name]}/g' {} \\;`

# Replace the base package
puts "\e[0;32m===> Replacing com.edify for project base package [#{options[:basepkg]}]\e[m"
`sed -i .bak -e 's/com\\.edify/#{options[:basepkg]}/g' build.gradle`
`find src/main -type f \\( ! -iname "*.png" \\) -exec sed -i .bak -e 's/com\\.edify/#{options[:basepkg]}/g' {} \\;`

`sed -i .bak -e 's/version = .+?/version = 1.0.0'/g build.gradle`

#Cleanup .bak files
`find . -iname "*.bak" -exec rm {} \\;`

puts "\e[0;32m===> Moving everything to the new base package [#{options[:basepkg]}]\e[m"
project_base_pkg_dir = "src/main/java/#{options[:basepkg].gsub('.', '/')}"

FileUtils.mkdir_p project_base_pkg_dir
`mv src/main/java/com/edify/* #{project_base_pkg_dir}/`

FileUtils.rm_rf "src/main/java/com/edify"

begin
  puts "\e[0;32m===> Creating first commit\e[m"
  `git add --all .`
  `git commit -m "[#{options[:name]}] initial commit"`
  puts "\e[0;32m===> Changing origin url to [#{options[:repo]}]\e[m"
  `git remote set-url origin #{options[:repo]}`
end unless options[:dry]

puts "\e[0;32m===> All done!! <===\e[m\n\n\e[0;33mNow just 'git push'\e[m"
