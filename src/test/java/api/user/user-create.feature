@regression @user
Feature: Creacion de usuarios

  Background:
    * url baseURL
    * def createUser = read('classpath:api/user/jsonData/createUser.json')

  @happyPath @createUser
  Scenario: Crear un nuevo usuario
    * def requestBody = createUser[0]

    Given path 'user'
    * request requestBody
    When method POST
    Then status 200
    * match response.code == 200
    * print response
    * def usernameDB = requestBody.username
    * def passwordDB = requestBody.password

  @unhappyPath
  Scenario: Crear un nuevo usuario sin enviar los datos
    Given path 'user'
    When method POST
    Then status 415
    * match response.code == 415

  @happyPath
  Scenario: Crear nuevos usuarios con una lista
    * def requestBody = createUser

    Given path 'user', 'createWithList'
    * request requestBody
    When method POST
    Then status 200
    * match response.code == 200
    * print response

  @unhappyPath
  Scenario: Crear nuevos usuarios con una lista sin enviar los datos
    Given path 'user', 'createWithList'
    When method POST
    Then status 415
    * match response.code == 415