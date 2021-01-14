class BaseAction
  class NonKeywordArgumentsError < StandardError; end

  def self.call(...)
    new(...).call
  end

  attr_reader :args, :data

  def initialize(*args, &block)
    raise NonKeywordArgumentsError if args.present? && !args[0].is_a?(Hash)

    @args = @data = args[0]
    @args.each do |name, value|
      instance_variable_set("@#{name}", value)
    end

    block.call if block_given?
  end

  def call; end

  private

  def response(status, *args)
    BaseResponse.new(status, *args)
  end
end
