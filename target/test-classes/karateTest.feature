Feature: Plan de pruebas

  Background:
    Given url baseUrl


  Scenario Outline: Create a pet from CSV
    And path "pet"
    And header Content-Type = 'application/json'
    * def requestBody =
      """{
            "id": #(<petId>),
            "category": {
                          "id": #(<petCategoryId>),
                          "name": "#(<petCategoryName>)"
                         },
            "name": "#(<petName>)",
            "photoUrls": ["#(<petPhotoUrls>)"],
            "tags": [
                      {
                        "id": #(<PetTagsId>),
                        "name": "#(<PetTagsName>)"
                      }
                    ],
            "status": "#(<PetStatus>)"
      }"""
    * print requestBody
    And request requestBody
    When method POST
    Then status <StatusCode>
    And match response.id == <petId>

    Examples:
      | read('classpath:helpers/DataPet2024.csv') |



  Scenario: Create a pet from Json
    And path "pet"
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:helpers/DataSchemaApiPet2024.json')
    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    And match response.id == 5



  Scenario Outline: Search pet by petId from CSV
    * path "pet/" + <petId>
    When method GET
    Then status <StatusCode>
    And match response.id == <petId>
    Then print response
    Examples:
      | read('classpath:helpers/DataPet2024.csv') |

  Scenario Outline: Update name status pet from CSV
    * path "pet/" + <petId>
    And header accept = 'application/json'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field name = '<petNewName>'
    And form field status = '<petNewName>'
    When method post
    Then status <StatusCode>
    Then print response
    Examples:
      | read('classpath:helpers/DataPet2024.csv') |

  Scenario Outline: search Pet by status from CSV
    * path "pet/findByStatus"
    And param status = '<petNewName>'
    When method get
    Then status <StatusCode>
    Then print response
    Examples:
      | read('classpath:helpers/DataPet2024.csv') |