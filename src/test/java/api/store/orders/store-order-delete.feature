@regression @store @order
Feature: Eliminación de ordenes

  Background:
    * url baseURL

  @happyPath
  Scenario: Eliminar una orden por id
    * def orderCreated = call read('classpath:api/store/orders/store-order-create.feature@createOrder')

    Given path 'store', 'order', orderCreated.idOrder
    When method DELETE
    Then status 200
    * def idOrderDeleted = orderCreated.idOrder

  @unhappyPath
  Scenario: Eliminar una orden con un id no existente
    Given path 'store', 'order', 99999
    When method DELETE
    Then status 404
    * match response.message == 'Order Not Found'

