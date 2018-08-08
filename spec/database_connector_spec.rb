require 'rspec'
require 'bundler'
Bundler.require
Dotenv.load!

require_relative '../lib/database_connector'

describe DatabaseConnector do
  context DatabaseConnector::DST do
    it 'should connect to DB server' do
      expect(DatabaseConnector::DST::DB.uri).to match(/jdbc:sqlserver:\/\/#{ENV['DB_SERVER']};databaseName=#{ENV['DST_DATABASE']};/)
    end
    it 'should connect successfully' do
      expect(DatabaseConnector::DST::DB.test_connection).to be_truthy
    end
  end
  context DatabaseConnector::EED do
    it 'should connect to DB server' do
      expect(DatabaseConnector::EED::DB.uri).to match(/jdbc:sqlserver:\/\/#{ENV['DB_SERVER']};databaseName=#{ENV['EED_DATABASE']};/)
    end
    it 'should connect successfully' do
      expect(DatabaseConnector::EED::DB.test_connection).to be_truthy
    end
  end
end