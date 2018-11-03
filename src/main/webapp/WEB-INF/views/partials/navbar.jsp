<nav id="sidebar">
	<div class="sidebar-header">
		<h3>Bootstrap Sidebar</h3>
	</div>

	<ul class="list-unstyled components">
		<p><b>DASHBOARD</b></p>
		<li><a href="#usuarioSubmenu" data-toggle="collapse"
			aria-expanded="false" class="dropdown-toggle">Usuario</a>
			<ul class="collapse list-unstyled" id="usuarioSubmenu">
				<li><a href="${pageContext.request.contextPath}/usuario/list">Gestionar
						Usuario</a></li>
			</ul></li>
		<li><a href="#clienteSubmenu" data-toggle="collapse"
			aria-expanded="false" class="dropdown-toggle">Cliente</a>
			<ul class="collapse list-unstyled" id="clienteSubmenu">
				<li><a href="${pageContext.request.contextPath}/cliente/index">Gestionar
						Cliente</a></li>
			</ul></li>
		<li><a href="#mascotaSubmenu" data-toggle="collapse"
			aria-expanded="false" class="dropdown-toggle">Mascota</a>
			<ul class="collapse list-unstyled" id="mascotaSubmenu">
				<li><a href="${pageContext.request.contextPath}/mascota/index">Gestionar
						Mascota</a></li>
			</ul></li>

	</ul>
</nav>