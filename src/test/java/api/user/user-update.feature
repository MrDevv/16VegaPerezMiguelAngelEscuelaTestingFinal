@regression @user
Feature: Actualizacion de datos de usuarios

  Background:
    * url baseURL
    * def updateUser = read('classpath:api/user/jsonData/updateUser.json')

  @happyPath
  Scenario: Actualizar datos de un usuario
    * def createdUser = call read('classpath:api/user/user-create.feature@createUser')
    * def requestBody = updateUser

    Given path 'user', createdUser.usernameDB
    * request requestBody
    When method PUT
    Then status 200
    * match response.code == 200

  @unhappyPath
  Scenario: Actualizar un usuario existente sin enviar sus datos
    * def createdUser = call read('classpath:api/user/user-create.feature@createUser')

    Given path 'user', createdUser.usernameDB
    When method PUT
    Then status 415
    * match response.code == 415

  @unhappyPath
  Scenario: Actualizar un usuario no existente
    * def usernameInvalido = 'usernameInvalido940'
    * def requestBody = updateUser

    Given path 'user', usernameInvalido
    * request requestBody
    When method PUT
    Then status 404
    * match response.code == 404