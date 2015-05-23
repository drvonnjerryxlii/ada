require 'csv'
require 'time'
require 'pathname'

# declare path to project root as a constant.
PROJECT_ROOT = Pathname(__dir__).parent

require PROJECT_ROOT.join('lib/far_mar/market')
require PROJECT_ROOT.join('lib/far_mar/product')
require PROJECT_ROOT.join('lib/far_mar/sale')
require PROJECT_ROOT.join('lib/far_mar/vendor')
