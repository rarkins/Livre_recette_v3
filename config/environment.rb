# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
LivreRecettesV3::Application.initialize!

ENV['RECAPTCHA_PUBLIC_KEY']  = '6Le0pMASAAAAAHuOMABxbu77cokFVT6JuwDoNybd'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6Le0pMASAAAAAETU1v9l83uPbuqETcW9h_ZdGi6e'