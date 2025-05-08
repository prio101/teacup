require 'logger'

module LoggerHelper
  @logger = Logger.new(STDOUT)

  def self.log(level, message)
    logger.formatter = proc do |severity, datetime, _progname, msg|
      "#{datetime}:\n" \
      "---------------------\n" \
      "#{severity} - #{msg}\n" \
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
      logger.debug(message)
    when :info
      logger.info(message)
    when :warn
      logger.warn(message)
    when :error
      logger.error(message)
    when :fatal
      logger.fatal(message)
    else
      logger.unknown(message)
    end
  end
end
