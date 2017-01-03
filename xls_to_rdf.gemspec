

Gem::Specification.new do |s|
	s.name = 'xls_to_rdf'
	s.version = '0.0.0.1'
	s.date = '2017-01-03'
	s.summary = "Converts xls file to RDF graph"
	s.description = "Converts xls file to RDF graph"
	s.authors = ["WiDu"]
	s.email = 'wdulek@gmail.com'
	s.files = ["lib/xls_to_rdf.rb"]
	s.homepage = 'https://github.com/widu/xls_to_rdf'
	s.license = 'MIT'
	s.add_runtime_dependency "linkeddata"
	s.add_runtime_dependency "roo"
end