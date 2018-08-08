module DatabaseConnector
  module DST
    class Config
      class << self
        include SequelConnect

        def filename
          DatabaseConnector.config_dir + 'dst_database.yml'
        end

        def stage
          ENV['DST_DB_STAGE'].downcase
        end
      end
    end

    Model = Class.new(Sequel::Model)
    Model.def_Model(self)

    DB     = DST::Config.DB
    SCHEMA = Sequel.qualify(:dst, :dbo)

  end
end
