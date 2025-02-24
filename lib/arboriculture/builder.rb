class Arboriculture::Builder

  def initialize
    @added = []
  end


  def method_missing(name, *args, **opts, &block)
    children = []
    if block_given?
      old_added = @added
      @added = []
      instance_eval(&block)
      children = @added
      @added = old_added
    end

    node = Arboriculture::Node.new(name, args, opts, children)
    @added << node
    node
  end

end
