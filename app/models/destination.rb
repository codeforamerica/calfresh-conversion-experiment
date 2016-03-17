class Destination
  def self.for_county(county_name)
    if counties_where_getcalfresh_available.include?(county_name) and randomizer_says_true?
      return "getcalfresh"
    else
      County.find(county_name).saws_name
    end
  end

  private
  def self.counties_where_getcalfresh_available
    ['Placer', 'San Francisco', 'San Diego', 'Solano', 'Marin']
  end

  def self.randomizer_says_true?
    [true, false].sample
  end
end
