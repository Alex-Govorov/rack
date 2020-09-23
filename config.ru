require_relative 'middleware/routes'
require_relative 'formats'
require_relative 'app'

use Routes
run App.new
