# Settings specified here will take precedence over those in config/environment.rb

if (request.host=='localhost')
  GOOGLE_MAPS_KEY = "ABQIAAAA-ClHV9cqqgGz8JA-fGno7BT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQn86O7CT-qQfO7vzqImieuTTYERA"
else
  GOOGLE_MAPS_KEY = "ABQIAAAAMKm5Yv65vhZQlBwb7lyQUBSqsR9f-x1HZ2VWWhkUm3d7g6SwJBStBRRPOqqUymPtywSwm04Yz_elJw"
end
# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

require 'ruby-debug'