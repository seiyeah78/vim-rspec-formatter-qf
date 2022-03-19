# class VimRspecFormatter
#   RSpec::Core::Formatters.register self, :example_failed
#
#   def initialize(output)
#     @output = output
#   end
#
#   def close(notification)
#     @output << "\n"
#   end
#
#
#   def example_failed(notification)
#     @output << "#{File.expand_path(notification.example.location)}: #{format_message(notification.exception.message)} \n"
#   end
#
#   private
#
#   def format_message(msg)
#     msg.gsub("\n", ' ').strip
#   end
# end

# require 'rspec/core/formatters/base_text_formatter'
# class VimRspecFormatter < RSpec::Core::Formatters::BaseTextFormatter
#   RSpec::Core::Formatters.register self, :message, :dump_summary, :dump_failures, :dump_pending
#
#   def message(notification)
#     output.puts notification.message
#   end
#
#   def dump_failures(notification)
#     return if notification.failure_notifications.empty?
#     output.puts notification.fully_formatted_failed_examples
#   end
#
#   def dump_summary(summary)
#   end
#
#   def dump_pending(notification)
#     return if notification.pending_examples.empty?
#     output.puts notification.fully_formatted_pending_examples
#   end
#
#   def seed(notification)
#     super
#     # output.puts notification
#   end
# end

require 'rspec/core/formatters/progress_formatter'
class VimRspecFormatter < RSpec::Core::Formatters::ProgressFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_pending, :example_failed, :start_dump, :dump_summary

  def example_passed(_notification)
    output.print RSpec::Core::Formatters::ConsoleCodes.wrap('😊  ', :success)
  end

  def example_pending(_notification)
    output.print RSpec::Core::Formatters::ConsoleCodes.wrap('😟  ', :pending)
  end

  def example_failed(_notification)
    output.print RSpec::Core::Formatters::ConsoleCodes.wrap('☠️  ', :failure)
  end

  def dump_summary(summary)
    output.puts "\nSummary:\n  " + summary.colorized_totals_line
  end

  def start_dump(_notification)
    output.puts
  end
end
