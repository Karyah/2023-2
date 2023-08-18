#Author: rm94488@fiap.com.br

@tag
Feature: Everything about store orders

Background:
	Given path 'store','order'
	
	@Post
	Scenario: Creates a new store order
		Given url UrlBase
		And request {"id": 5,"petId": 0,"quantity": 1,"shipDate": "2023-08-11T20:16:24.089Z","status": "placed","complete": true}
		When method POST
		Then status 200
		
	@GetById
  Scenario: Gets the order by id
    Given url UrlBase
    And path '5'
    When method GET
    Then status 200
    
	@Delete 
	Scenario: Delets one order by id
  	Given url UrlBase
  	And path '5'
  	When method DELETE 
  	Then status 200
