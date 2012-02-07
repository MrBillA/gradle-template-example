# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'less', :all_on_start => true, :all_after_change => true, :output => 'src/main/webapp/css' do
  watch(%r{^.+bootstrap\.less$})
  watch(%r{^.+application\.less$})
end

guard 'coffeescript', :input => 'src/main/webapp/WEB-INF/coffeescript', :output => 'src/main/webapp/js', :all_on_start => true
