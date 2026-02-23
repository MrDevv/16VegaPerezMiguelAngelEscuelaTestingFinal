@regression @store @order
Feature: Busqueda de orden de compra

  Background:
    * url baseURL

  @happyPath @debug
  Scenario: Buscar orden de compra por id
    * def orderCreated = call read('classpath:api/store/orders/store-order-create.feature@createOrder')

    Given path 'store', 'order', orderCreated.idOrder
    When method GET
    Then status 200
    * match response.id == orderCreated.idOrder
    * print response

  @unhappyPath
  Scenario: Buscar orden de compra con id no existente
    * def idInvalido = 94848838

    Given path 'store', 'order', 9484883822
    When method GET
    Then status 404
    * print response