{include file="header.tpl"}
{foreach from=$books item=$book}
    <h1>LA busqueda fue: {$book->nombre}</h1>
{/foreach}

<table class="table">
  <thead>
    <tr>
      <th scope="col">Titulo</th>
      <th scope="col">Autor</th>
      <th scope="col">Año</th>
      <th scope="col">descripcion</th>
      <th scope="col">Genero</th>
      <th scope="col">Disponibilidad</th>
      <th scope="col">.....</th>
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

            <td><a href='vermas/{$book->id}' type='button' class='btn btn-danger'>Ver mas</a></td>
        </tr>
    {/foreach}
  </tbody>
</table>
{include file="footer.tpl"}