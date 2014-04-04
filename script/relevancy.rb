require 'ap'
infile_name = 'keywords.txt'
outfile_name = 'api_results.txt'
outfile = File.new(outfile_name, "w")

File.open(infile_name).each do |line|

  sears_products = Gid::Product.all(@asset, line)
  tec_products = TecWebServices::Request.new(line).get 
  # write the result out to a file
  outfile.write("Sears Products: #{sears_products.inspect}")
  outfile.write("TEC Procucts: #{tec_products.inspect}")

end

outfile.close
