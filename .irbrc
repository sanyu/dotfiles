# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

# auto indent, _ special var
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:PROMPT_MODE]  = :SIMPLE

if File.exist?(path = File.expand_path('.irbrc')) && Dir.pwd != File.expand_path("~")
  load path
end
