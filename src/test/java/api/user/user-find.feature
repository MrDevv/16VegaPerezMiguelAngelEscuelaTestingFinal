@regression @user
Feature: Busqueda de usuarios

  Background:
    * url baseURL

  @happyPath
  Scenario: Buscar un usuario por su username
    * def createdUser = call read('classpath:api/user/user-create.feature@createUser')

    Given path 'user', createdUser.usernameDB
    When method GET
    Then status 200
    * match response.username == createdUser.usernameDB
    * print response

  @unhappyPath
  Scenario: Buscar un usuario por un username no existente
    * def usernameInvalido = 'usernameInvalido940'

    Given path 'user', usernameInvalido
    When method GET
    Then status 404
    * match response.message == 'User not found'
    * print response
