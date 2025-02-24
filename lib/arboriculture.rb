require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module Arboriculture

  class Error < StandardError; end

  Node = Data.define(:name, :args, :opts, :children)


  def self.build(code = nil, **vars, &block)
    builder = Builder.new
    vars.each do |k,v|
      builder.instance_variable_set("@#{k}".to_sym,v)
    end

    if block_given?
      builder.instance_eval(&block)
    else
      builder.instance_eval(code)
    end
  end

end
