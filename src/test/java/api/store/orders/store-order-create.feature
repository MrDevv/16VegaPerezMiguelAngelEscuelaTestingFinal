@regression @store @order
Feature: Creación de órdenes de mascotas

  Background:
    * url baseURL
    * def createOrder = read('classpath:api/store/orders/jsonData/createOrder.json')

  @happyPath @createOrder
  Scenario: Crear una nueva orden de mascota
    * def requestBody = createOrder

    Given path 'store', 'order'
    * request requestBody
    When method POST
    Then status 200
    * match response.petId == requestBody.petId
    * def idOrder = response.id
    * print idOrder

  @unhappyPath
  Scenario: Crear una nueva orden sin enviar los datos
    Given path 'store', 'order'
    When method POST
    Then status 415