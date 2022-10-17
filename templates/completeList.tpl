{include file="header.tpl"}
<h3>Libros disponibles</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Titulo</th>
      <th scope="col">Autor</th>
      <th scope="col">Año</th>
      <th scope="col">descripcion</th>
      <th scope="col">Genero</th>
      <th scope="col">Disponibilidad</th>
      <th scope="col">Ver mas</th>
      {if isset($smarty.session.USER_ID)}
        <th scope="col">Editar</th>
        <th scope="col">Eliminar</th>
        <th scope="col">Cambiar disponibilidad</th>
      {/if}
    </tr>
  </thead>
  <tbody>
    {foreach from=$books item=$book}
    <tr>
        <th scope="row">{$book->nombre}</th>
        <td>{$book->autor}</td>
        <td>{$book->anio}</td>
        <td>{$book->descripcion|truncate:25}</td>
        <td>{$book->genero}</td>
        <td>
        {if $book->disponibilidad}
             Disponible
        {else}
            No disponible
        {/if}

    </td>
    <td><a href='vermas/{$book->id}' type='button' class='btn btn-success'>Ver mas</a></td>
    {if isset($smarty.session.USER_ID)}
      <td><a href='editarlibro/{$book->id}' type='button' class='btn btn-warning'>Editar</a></td>
      <td><a href='eliminarlibro/{$book->id}' type='button' class='btn btn-danger'>Eliminar</a></td>
      {if $book->disponibilidad==1}
      <td><a href='editarNodisponibilidad/{$book->id}' type='button' class='btn btn-warning'>Disponibilidad</a></td>
      {else}
        <td><a href='editardisponibilidad/{$book->id}' type='button' class='btn btn-warning'>No Disponible</a></td>
      {/if}  
    {/if}
      
    
    {/foreach}
  </tbody>
</table>
<p class="mt-3"><small>Mostrando {$count} libros</small></p>
{include file="footer.tpl"}