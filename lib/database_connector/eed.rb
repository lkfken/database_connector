module DatabaseConnector
  module EED
    class Config
      class << self
        include SequelConnect

        def filename
          DatabaseConnector.config_dir + 'eed_database.yml'
        end

        def stage
          ENV['EED_DB_STAGE'].downcase
        end
      end
    end

    Model = Class.new(Sequel::Model)
    Model.def_Model(self)

    DB     = EED::Config.DB
    SCHEMA = Sequel.qualify(:eed, :dbo)
  end
end
