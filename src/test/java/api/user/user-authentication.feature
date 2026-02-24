@regression @user @authentication
Feature: Autenticación de usuarios

  Background:
    * url baseURL
    * def createUserJson = read('classpath:api/user/jsonData/createUser.json')

  @happyPath
  Scenario: Iniciar sesión con credenciales correctas
    * def createUser = call read('classpath:api/user/user-create.feature@createUser')

    Given path 'user', 'login'
    * params {username: '#(createUser.usernameDB)', password: '#(createUser.passwordDB)'}
    When method GET
    Then status 200
    * match response.code == 200

  @unhappyPath
  Scenario: Iniciar sesión con credenciales incorrectas
    * def usernameIncorrecto = 'usernameInvalido129'
    * def passwordIncorrecta = 'passwordInvalida901'

    Given path 'user', 'login'
    * params {username: '#(usernameIncorrecto)', password: '#(passwordIncorrecta)'}
    When method GET
    Then status 401

  @unhappyPath
  Scenario: Iniciar sesión sin enviar credenciales
    Given path 'user', 'login'
    * params {username: '', password: ''}
    When method GET
    Then status 400

  @happyPath
  Scenario: Cerrar sesión
    Given path 'user', 'logout'
    When method GET
    Then status 200
    * match response.code == 200
    * match response.message == 'ok'