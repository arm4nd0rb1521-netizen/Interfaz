class CrearFooter extends HTMLElement {
    connectedCallback() {
        this.innerHTML = `
     <footer>

            <div class="footer-contenedor">

                <div class="footer-columna">

                    <img src="../mayadev.png"
                         alt="Logo My Own Shop"
                         class="logo-footer">

                </div>

                <div class="footer-columna">

                    <h3>Navegación</h3>

                    <a href="https://www.ipn.mx/" target="_blank">
                        IPN
                    </a>

                </div>

                <div class="footer-columna">

                    <h3>Información Legal</h3>

                    <a href="terminos.html">
                        Términos y Condiciones
                    </a>

                    <br><br>

                    <a href="privacidad.html">
                        Aviso de Privacidad
                    </a>

                    <br><br>

                    <a href="derechos.html">
                        Derechos de Autor
                    </a>

                </div>

                <div class="footer-columna">

                    <h3>Redes Sociales</h3>

                    <div class="redes">

                        <a href="https://www.instagram.com/miakhalifa/?hl=es">
                            <i class="fa-brands fa-instagram"></i>
                        </a>

                        <a href="https://www.facebook.com/ipn.mx/?locale=es_LA">
                            <i class="fa-brands fa-facebook"></i>
                        </a>

                        <a href="https://x.com/IPN_MX?lang=es">
                            <i class="fa-brands fa-x-twitter"></i>
                        </a>

                        <a href="https://www.tiktok.com/@ipn.oficial">
                            <i class="fa-brands fa-tiktok"></i>
                        </a>

                    </div>

                </div>

            </div>

            <div class="copyright">

                © 2026 My Own Shop - MayaDev.
                Todos los derechos reservados.

            </div>

        </footer>
        `;
    }
}

customElements.define('crear-footer', CrearFooter);