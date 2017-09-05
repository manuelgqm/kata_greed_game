watch('spec/.*\.rb') { |spec| system "clear && rspec --color #{spec}" }
watch('^lib/(.*)\.rb') do |m|
	spec_file_name = m[1] + "_spec.rb"
	system "clear && date && rspec spec/#{spec_file_name}"
end