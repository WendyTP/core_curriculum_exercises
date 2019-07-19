=begin
rule: do not make the implementation details public
=end


class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-" + ("-" * @message.size ) + "-+"
  end

  def empty_line
    "| " + (" " * @message.size) + " |"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new("")
puts banner

banner = Banner.new("To boldy go where no one has gone")
puts banner


