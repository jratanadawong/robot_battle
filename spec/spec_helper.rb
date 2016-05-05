require 'rspec'

# Include debugging tools by default so that you don't have to add them.
require 'pry'
require 'byebug'

# Tool for safely requiring files that might not exist yet.
def safe_require(file)
  require file
rescue LoadError
  # ignore
end

# Safely require the files that are expected to be created.
safe_require '../lib/robot'
safe_require '../lib/item'
safe_require '../lib/weapon'
safe_require '../lib/box_of_bolts'
safe_require '../lib/laser'
safe_require '../lib/plasma_cannon'
safe_require '../lib/grenade'
