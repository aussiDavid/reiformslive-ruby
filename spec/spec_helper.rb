$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'reiformslive/session'
require 'reiformslive/credentials'
require 'reiformslive/template'
require 'reiformslive/user_template'
require 'reiformslive/form'

require 'webmock/rspec'  
WebMock.disable_net_connect!(allow_localhost: true)

require 'support/vcr_setup'