# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
LivreRecettesV3::Application.initialize!

ENV['RECAPTCHA_PUBLIC_KEY']  = '6LdgiNgSAAAAAGvWe3n9bo_yrN6NdxBl1X9BRrlq'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6LdgiNgSAAAAADlsfxPs6eTq4klKiK1k5-ioRxrU'