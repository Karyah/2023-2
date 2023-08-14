#Author: rm94488@fiap.com.br

@tag
Feature: Everything about your Pets

Background:
	Given path 'pet'

	@GetByStatus
  Scenario: Finds Pets by status
    Given url UrlBase
    And path 'findByStatus'
    And param status = 'available'
    When method GET
    Then status 200
    
	@Post
	Scenario: Creates a new pet
		Given url UrlBase
		And request {"id": 7,"category": {"id": 7,"name": "Juninho"},"name": "Juninho","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "pending"}
		When method POST
		Then status 200
		
	@Put
	Scenario: Modify an existing registry of a pet
		Given url UrlBase
		And request {"id": 7,"category": {"id": 7,"name": "Juninho"},"name": "Juninho","photoUrls": ["string"],"tags": [{"id": 7,"name": "Juninho"}],"status": "sold"}
		When method PUT
		Then status 200

 	@GetById
 	Scenario: Finds pet by id
 		Given url UrlBase
 		And path '7'
 		When method GET
 		Then status 200
 		
 	@Delete 
 	Scenario: Deleting the registry of one pet by id
 		Given url UrlBase
 		And path '7'
 		When method DELETE 
 		Then status 200
 	
 	