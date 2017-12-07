Given ('I login with credentials login:{string}, password:{string}') do |username, password|
  login(username, password)
end

Given ('I login to blog') do
  login('dhh', 'secret')
end

private def login(username, password)
  host_port = Capybara.app_host.split("://").last
  visit "http://" + username + ":" + password + "@" + host_port + "/"
end
