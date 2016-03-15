require 'csv'

class County
  def self.find(name)
    new(DATA[name])
  end

  def self.count
    DATA.count
  end

  def self.names
    DATA.keys
  end

  def self.all
    names.map { |name| find(name) }
  end

  def initialize(data_from_file)
    @data = data_from_file
  end

  def cbo_account?
    data['cbo_account'] == 'yes' ? true : false
  end

  def method_missing(method, *args, &block)
    data_elements = data.keys
    if data_elements.include?(method.to_s)
      data[method.to_s]
    else
      raise NoMethodError
    end
  end

  private
  def data
    @data
  end

  def self.load_data!
    csv_data = CSV.read(data_csv_path, headers: true)
    create_hash_from_csv_data(csv_data)
  end

  def self.data_csv_path
    File.expand_path('../data/california_counties.csv', __FILE__)
  end

  def self.create_hash_from_csv_data(csv_data)
    hash = Hash.new
    headers = csv_data.headers
    csv_data.each do |row|
      single_county_hash = Hash.new
      headers.each do |column_name|
        single_county_hash[column_name] = row[column_name]
      end
      hash[row["name"]] = single_county_hash
    end
    hash
  end

  DATA = load_data!
end
