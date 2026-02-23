@regression @store @inventory
Feature: Consulta de inventario de mascotas
  Background:
    * url baseURL

  @happyPath
  Scenario: Obtener inventario de mascotas por estado
    Given path 'store', 'inventory'
    When method GET
    Then status 200

  @unhappyPath
  Scenario: Consultar inventario con método HTTP inválido
    Given path 'store', 'inventory'
    When method POST
    Then status 405