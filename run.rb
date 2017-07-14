require 'csv'
require 'json'

def findRateFromZipAndState(ra, s, p, z)
    a = []
  p.each do |pd|
    if pd['state'] == s && pd['rate_area'] == ra && pd['metal_level'] == 'Silver'
      a << pd.merge!("zipcode" => z)
    end
  end
  return a
end

def findStateFromZip(z, j)
  j.each do |zd|
    if zd['zipcode'] == z
      return zd
    end
  end
end

zips = CSV.open('./zips.csv', :headers => true).map { |x| x.to_h }
plans = CSV.open('./plans.csv', :headers => true).map { |x| x.to_h }
slcsp = CSV.open('./slcsp.csv', :headers => true).map { |x| x.to_h }

finalHash = Hash.new

slcsp.each do |k|
  zipJson = findStateFromZip(k['zipcode'], zips)
  ratesArray = findRateFromZipAndState(zipJson['rate_area'], zipJson['state'], plans, k['zipcode'])
  ratesArray.each {|i| (finalHash[k['zipcode']] ||= []) << i['rate']}
end

finalHash.each { |k, v|v.sort! }

CSV.open("slcsp.csv", "w") do |csv|
  csv << ["zipcode","rate"]
  slcsp.each do |s|
    row = [s['zipcode']]
    unless finalHash[s['zipcode']].nil?
      if finalHash[s['zipcode']].length > 1
        finalHash[s['zipcode']].shift
        row << finalHash[s['zipcode']].first
      end
    else
      row << nil
    end
    csv << row
  end
end
