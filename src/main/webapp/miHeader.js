class CrearHeader extends HTMLElement {
    connectedCallback() {
        this.innerHTML = `
            <header>
                <div class="principal">
                    <nav class="navegacion">
                        <a href="index.html">Home</a>
                        <a href="IVentas.html">Ventas</a>
                        <a href="ILog.html">Logistica</a>
                        <a href="IAdmin.html">Administracion</a>

                    </nav>

                    <div class="nombre">
                        <h3>My Own Shop</h3>
                    </div>
                </div>
            </header>
            `;
    }
}

customElements.define('crear-header', CrearHeader);

