import javascript

/**
 * Detecta concatenación de strings en consultas SQL
 */
from CallExpr call
where call.getCallee().getName() = "query"
  and call.getArgument(0).getUntrustedStringValue().toUpperCase().matches("%SELECT%")
select call, "Posible inyección SQL al concatenar en consultas"
