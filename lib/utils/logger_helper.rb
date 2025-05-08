require 'logger'

module LoggerHelper
  @logger = Logger.new(STDOUT)

  def self.log(level, message)
    logger.formatter = proc do |severity, datetime, _progname, msg|
      "---------------------\n" \
      "#{severity.colorize(:red).bold} - #{msg}\n" \
      "---------------------\n"
    end
    output(level, message)
  end

  private

  def self.logger
    @logger
  end

  def self.output(level, message)
    case level
    when :debug
      logger.debug(message.colorize(:blue).on_yellow)
    when :info
      logger.info(message.colorize(:blue).on_gray.bold)
    when :warn
      logger.warn(message.colorize(:green).on_gray)
    when :error
      logger.error(message.colorize(:white).on_red.bold)
    when :fatal
      logger.fatal(message.colorize(:white).on_red.bold)
    else
      logger.unknown(message.colorize(:white).on_black.bold)
    end
  end
end
