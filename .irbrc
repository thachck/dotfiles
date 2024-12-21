require "irb/completion"

IRB.conf[:PROMPT_MODE] = :SIMPLE


Reline::Face.config :completion_dialog do |config|
  config.define :default, foreground: :white, background: :black
  config.define :enhanced, foreground: :black, background: :green
  config.define :scrollbar, foreground: :bright_white, background: :black
end

