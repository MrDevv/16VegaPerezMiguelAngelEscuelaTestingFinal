@regression @user
Feature: Eliminación de usuarios

  Background:
    * url baseURL

  @happyPath
  Scenario: Eliminar un usuario por username
    * def createUser = call read('classpath:api/user/user-create.feature@createUser')

    Given path 'user', createUser.usernameDB
    When method DELETE
    Then status 200
    * match response.code == 200
    * match response.message == createUser.usernameDB

  @unhappyPath
  Scenario: Eliminar un usuario no existente
    * def usernameInvalido = 'usernameInvalido940'

    Given path 'user', usernameInvalido
    When method DELETE
    Then status 404
