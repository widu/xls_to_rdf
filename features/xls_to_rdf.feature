Feature: I want to convert xlsx file to rdf graph

  Scenario: Default options
    Given the xlsx: "./xls_test_files/test1.xlsx"	
    When the xls_to_rdf is run
    Then the output graph should contain "id1"
    And the output graph should contain "id2"

  Scenario: Slected sheets
    Given the xlsx: "./xls_test_files/test1.xlsx"	
    When the xls_to_rdf is run with sheets ="Sheet2"
    Then the output graph should contain "id1"
    And the output graph should contain "id2"