#Given /^a user with username "([^\"]*)" and password "([^\"]*)"$/ do |username, password|
#  @me ||= Factory(:user, :username => username, :password => password,
#                  :password_confirmation => password, :getting_started => false)
#  @me.reload
#end

#Given /^a user with email "([^\"]*)"$/ do |email|
#  user = Factory(:user, :email => email, :password => 'password',
#                 :password_confirmation => 'password', :getting_started => false)
#end

#Given /^a user with username "([^\"]*)"$/ do |username|
#  user = Factory(:user, :email => username + "@" + username + '.' + username, :username => username,
#                 :password => 'fuubar', :password_confirmation => 'fuubar', :getting_started => false)
#end

#Given /^a user named "([^\"]*)" with email "([^\"]*)"$/ do |name, email|
#  first, last = name.split
#  username = "#{first}_#{last}" if first
#  user = Factory.create(:user, :email => email, :password => 'password', :username => "#{first}_#{last}",
#                 :password_confirmation => 'password', :getting_started => false)

#  user.profile.update_attributes!(:first_name => first, :last_name => last) if first
#  user.aspects.create!(:name => "Besties")
#  user.aspects.create!(:name => "Unicorns")
#end
#
#Then /^my "([^\"]*)" should be "([^\"]*)"$/ do |field, value|
#  @me.reload.send(field).should == value
#end
