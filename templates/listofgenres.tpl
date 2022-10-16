{include file="header.tpl"}
<h3>Generos disponibles</h3>
<ul class="list-group">
{foreach from=$genders item=$gender}   
    <li class='list-group-item d-flex justify-content-between align-items-center'>
    <span>{$gender->genero}</span>
        <div>
        <a href='librosporgenero/{$gender->id_genero}' type='button' class='btn btn-success'>Ver genero</a>
    
    {if isset($smarty.session.USER_ID)}
        <a href='editargenero/{$gender->id_genero}' type='button' class='btn btn-warning'>Editar genero</a>
        <a href='eliminargenero/{$gender->id_genero}' type='button' class='btn btn-danger'>Eliminar genero</a>
    {/if}
    </div>
    </li>
{/foreach}
</ul>

{include file="footer.tpl"}