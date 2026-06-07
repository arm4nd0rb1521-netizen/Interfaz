class CrearFooter extends HTMLElement {
    connectedCallback() {
        this.innerHTML = `
            <footer>
                <div class="contenido">

                    <div class="columnas">
                        <img src="../mayadev.png" width="100" height="100">
                    </div>

                    <div class="columnas">
                        <h3>Navegación</h3>
                        <a href="IHome.html">Inicio</a>
                    </div>

                    <div class="columnas">
                        <h3>Información Legal</h3>
                        <p>Términos y condiciones</p>
                    </div>

                    <div class="columnas">
                        <h3>Redes</h3>
                        <p>Facebook</p>
                        <p>Instagram</p>
                    </div>

                </div>
            </footer>
        `;
    }
}

customElements.define('crear-footer', CrearFooter);