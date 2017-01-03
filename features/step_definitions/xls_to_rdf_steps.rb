load './lib/xls_to_rdf.rb'
require 'rdf_to_graphviz'

Given(/^the xlsx: "([^"]*)"$/) do |arg1|
  @xls = arg1
end

When(/^the xls_to_rdf is run$/) do
  conwerter = XlsToRdf.new
  @graph = conwerter.xls_to_rdf(@xls)
  # puts @graph.to_ttl
  konwerter = RdfToGraphviz.new
  @output = konwerter.save_rdf_graph_as(@graph)
end

When(/^the xls_to_rdf is run with sheets ="([^"]*)"$/) do |arg1|
  conwerter = XlsToRdf.new
  xls_options = { :sheets => [arg1] }
  @graph = conwerter.xls_to_rdf(@xls, xls_options)
  # puts @graph.to_ttl
  konwerter = RdfToGraphviz.new
  @output = konwerter.save_rdf_graph_as(@graph)
end

Then(/^the output graph should contain "([^"]*)"$/) do |arg1|
  expect(@graph.to_ttl).to include(arg1)
end