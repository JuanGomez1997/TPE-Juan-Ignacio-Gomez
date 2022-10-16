{include file="header.tpl"}


    {foreach from=$librerys item=$librery}
        {if {$librery->id}}
            <div class="d-flex justify-content-center">
            <h1 class="display-4">{$librery->nombre}</h1><br>
            </div>
            <div class="d-flex p-2 bd-highlight">
            <p>Genero: {$librery->genero}</p><br>
            </div>
            <div class="d-flex p-2 bd-highlight">
            <p class="text-capitalize">Autor: {$librery->autor}</p><br>
            </div>
            <div class="d-flex p-2 bd-highlight">
            <p class="text-capitalize">Año: {$librery->anio}</p><br>
            </div>
            <div class="d-flex p-2 bd-highlight">
            <p class="text-center">Descripcion: {$librery->descripcion}</p>
            </div>
        {/if}
        
    {/foreach}




{include file="footer.tpl"}