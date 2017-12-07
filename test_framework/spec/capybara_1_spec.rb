require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'capybara/webkit'
require 'spec_helper'

describe 'test1' do

 include Capybara::DSL

 before do
 Capybara.run_server = false

 Capybara.current_driver = :webkit
 end
 


 it 'my first rspec test' do
  visit '/articles'
  click_link 'New article'
 end


end
