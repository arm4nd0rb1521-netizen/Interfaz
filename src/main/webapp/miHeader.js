class CrearHeader extends HTMLElement {
    connectedCallback() {
        this.innerHTML = `
            <header>
                <div class="principal">
                        <img src='../logo.png' class='logo' alt='logo' width='100px' height='100px'>
                </div>
                <div class='nave'>
                    <nav class="navegacion">
                        <a href="../HTMLs/IHome.html">Home</a>
                        <a href="../HTMLs/IVentas.html">Ventas</a>
                        <a href="../HTMLs/Reportes.html">Reportes</a>
                        <a href="../HTMLs/Proveedores.html">Proveedores</a>
                        <a href="ILog.html">Compras</a>
                        <a href="../HTMLs/Historial del sistema.html">Movimientos de stock</a>
                        <a href="IAdmin.html">Detalles de compra</a>
                        <a href="IAdmin.html">Detalles de venta</a>
                        <a href="Usuarios.html">Usuarios</a>
                        <a href="../HTMLs/Roles.html">Roles y permisos</a>
                        <a href="Productos.html">Productos</a>
                        <a href="IAdmin.html">Categorias de productos</a>

                    </nav>
                </div>
            </header>
            `;
    }
}

customElements.define('crear-header', CrearHeader);

