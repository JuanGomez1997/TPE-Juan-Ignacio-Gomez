{include file="header.tpl"}

<form class="row g-3" method="POST" >
  <div class="col-12">
    <label for="inputAddress" class="form-label">Titulo:</label>
    <input type="text" class="form-control" id="inputAddress" name="nombre" value="" placeholder="Titulo">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">Autor:</label>
    <input type="text" class="form-control" id="inputAddress" name="autor" value="" placeholder="Autor">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">Año:</label>
    <input type="text" class="form-control" id="inputAddress" name="anio" value="" placeholder="Año">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">Descripcion:</label>
    <input type="text" class="form-control" id="inputAddress" name="descripcion" value="" placeholder="descripcion">
  </div>
  <div class="col-12">
    <select class="form-select" aria-label="Default select example" name="seleccion">
        <option selected>Genero</option>
        {foreach from=$genders item=$gender}
            <option value="{$gender->id_genero}">{$gender->genero}</option>
        {/foreach}
    </select>
  </div>

  <div class="col-12">
    <button type="submit" class="btn btn-primary">Editar libro</button>
  </div>
</form>
{include file="footer.tpl"}