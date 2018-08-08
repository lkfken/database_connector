require 'sequel_connect'

module DatabaseConnector
  def app_root
    (Pathname(__dir__) + '..').realpath
  end

  def config_dir
    app_root + 'config'
  end

  module_function :app_root, :config_dir
end

require_relative 'database_connector/dst'
require_relative 'database_connector/eed'

