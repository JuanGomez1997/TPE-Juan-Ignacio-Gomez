{include file="header.tpl"}
<h1 class="titulo">Biblioteca Centinela</h1>

{if isset($smarty.session.USER_ID)}
  <div class="card">
  <h3 class="h3-medio">Acceso Administrador</h3>
  <div class="card-body div-medio">
    Bienvenido administrador usted es parte del personal de la biblioteca, asi que tiene permitido agregar,modificar e eliminar libros y generos.
  </div>
</div>
{else}
  <div class="card">
  <h3 class="h3-medio">Acceso para visitantes</h3>
  <div class="card-body div-medio">
  Los profesores e investigadores visitantes tienen acceso a las bibliotecas y sus equipamientos y pueden utilizar el servicio de préstamo y los recursos electrónicos, estos últimos desde los ordenadores habilitados de la Biblioteca, siempre y cuando la licencia del recurso lo permita.
  </div>
</div>
{/if}
<div class="card">
  <h3 class="h3-medio">Información sobre el funcionamiento de la Biblioteca</h3>
  <div class="card-body div-medio">
    En su primera visita pueden solicitar información sobre el funcionamiento de la Biblioteca en el mostrador.
  </div>
</div>

<div class="card color-card">
  <h3 class="h3-medio">Préstamo</h3>
  <div class="card-body div-medio">
    Pueden tomar en préstamo libros, durante un máximo de diez días.
  </div>
</div>
<div class="card">
  <h3 class="h3-medio">Petición de documentos</h3>
  <div class="card-body div-medio">
  Los visitantes de más de 15 días deben solicitar las obras situadas en el depósito a través del catálogo
  </div>
</div>

<div class="card">
  <h3 class="h3-medio">Salas de estudio</h3>
  <div class="card-body div-medio">
  En las distintas bibliotecas existen salas para el estudio individual, en un ambiente de silencio absoluto. Durante las fechas de exámenes se habilitan aulas como espacios de estudio y se reutilizan otras salas de las bibliotecas para ampliar el número de puestos. Existe un sistema de reservas online que permite reservar con antelación un puesto de estudio.
  </div>
</div>






{include file="footer.tpl"}