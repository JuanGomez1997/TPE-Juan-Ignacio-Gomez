{include 'header.tpl'}

<div class="mt-5 w-25 mx-auto">
    <form method="POST" action="validacion">
        <div class="form-group">
            <label for="email">Usuario</label>
            <input type="text" required class="form-control" id="email" name="usuario" aria-describedby="emailHelp" placeholder="Usuario">
        </div>
        <div class="form-group">
            <label for="password">Contraseña:</label>
            <input type="password" required class="form-control" id="password" name="contrasenia" placeholder="Contraseña">
        </div>

        {if $error} 
            <div class="alert alert-danger mt-3">
                {$error}
            </div>
        {/if}
        <button type="submit" class="btn btn-primary mt-3">Entrar</button>
    </form>
</div>

{include file='footer.tpl'}