require 'roo'

require 'linkeddata'

class XlsToRdf

def xls_to_rdf(xls, xls_options = nil)

  xlsx = Roo::Excelx.new(xls)

  xls_options ||= { :sheets => xlsx.sheets}


# xlsx = Roo::Excelx.new("test1.xlsx")
  # puts xlsx.info
  # puts xlsx.sheets
# csv_options ||= { :col_sep => ',', :headers => true}
  sheets = xls_options[:sheets]
  puts sheets
 
graph = RDF::Graph.new
wdc = RDF::Vocabulary.new("http://vieslav.pl/csv/0.1/")
# xlsx.sheets.each do |sheet|
sheets.each do |sheet|
	puts sheet
	xlsx.default_sheet = sheet
	table = RDF::Node.new
	# graph <<  [table, RDF.type, wdc['table']]

	# graph <<  [table, RDF::RDFS.label, sheet]
	n=1
	header = []
	xlsx.each_row_streaming(pad_cells: true) do |row|
		# puts n
  		if n==1 then
  			row.each do |cell|
  				# puts cell.coordinate
  	 			value = cell.cell_value
     			if value != nil then 
     				header << value
     				# puts value
     			end
     		end
  		else	
    		bnode = RDF::Node.new
			# graph <<  [table, RDF::RDFS.member, bnode]
 	 		graph <<  [bnode, RDF.type, wdc[sheet.strip]]
 			# graph <<  [bnode, RDF.type, wdc.row]
 			k=0
  			row.each do |cell|
  				if cell != nil then
  	 				value = cell.cell_value
  	 			else
  	 				value = nil
  	 			end
     			if  header[k] != nil then 
     				# puts header[k]
					# graph <<  [bnode, wdc[header[k].strip], value]
					if value != nil then
						graph <<  [bnode, wdc[header[k].strip], value ]
					else
						graph <<  [bnode, wdc[header[k].strip], ""]
					end
    			end
    			k = k + 1
  			end
  		end
  		n = n + 1
	end
end
graph
end

end