require_relative 'middleware/routes'
require_relative 'middleware/formats'
require_relative 'app'

use Routes
use Formats
run App.new
