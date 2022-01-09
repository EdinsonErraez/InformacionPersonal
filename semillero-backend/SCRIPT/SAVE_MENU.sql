DECLARE @v_id_menu INT,
		@v_id_producto INT,
		@v_id_url VARCHAR(255),
		@v_id_descr VARCHAR(255),
		@v_id_name VARCHAR(100),
		@v_is_parent BIT,
		@v_id_parent INT,
		@v_id_rol INT

--Validar si se crea un menu padre o submenu (1 Menu, 0 Submenu)
SELECT @v_is_parent = 0

--Cargar la ID del Menu padre
SELECT @v_id_parent = 10087

--Cargar la URL
SELECT @v_id_url = 'views/'

--SELECT * FROM cew_menu c  ORDER BY c.me_id DESC

--Cargar la descripcion
SELECT @v_id_descr = 'SubMenu para practica de repositorio'

--Cargar el nombre del menu
SELECT @v_id_name = 'MNU_REPOSITORIO_AAEN_NDQS'

--Cargar la ID del rol
SELECT @v_id_rol = ro_rol FROM ad_rol WHERE ro_descripcion = 'SEMILLERO'

--Cargar la ID del menu
SELECT @v_id_menu = max(me_id) FROM cew_menu
SELECT @v_id_menu = @v_id_menu + 1 

--Cargar el ID de productos
SELECT @v_id_producto = cl.pd_producto FROM cl_producto cl WHERE cl.pd_descripcion = 'CLIENTES'

--Eliminar si existe el registro del menu
IF EXISTS(SELECT 1 FROM cew_menu WHERE me_name = @v_id_name)
BEGIN
	SELECT @v_id_menu = me_id FROM cew_menu WHERE me_name = @v_id_name
	DELETE FROM cew_menu_role WHERE mro_id_menu = @v_id_menu AND mro_id_role = @v_id_rol
	DELETE FROM cew_menu WHERE me_name = @v_id_name
END

--Si se va a crear un padre se debe enviar nulo el campo id padre y la url
IF @v_is_parent = 1
BEGIN
	SELECT @v_id_parent = NULL
	SELECT @v_id_url = NULL	
END

--INSERTAR EL MENU
INSERT INTO dbo.cew_menu (
	me_id,		me_id_parent,	me_name,		me_visible,	me_url,
	me_order,	me_id_cobis_product,
	me_option,	me_description,		me_version, 	me_container)
VALUES (
	@v_id_menu,	@v_id_parent,	@v_id_name,		1,			@v_id_url,
	1,			@v_id_producto,
	0,			@v_id_descr,	NULL,			'CWC')

--INSERTAR EL ROL CON MENU
INSERT INTO dbo.cew_menu_role
	(mro_id_menu,	mro_id_role)
VALUES
	(@v_id_menu,	@v_id_rol)

--Verificar
SELECT * FROM cew_menu ce WHERE ce.me_name = @v_id_name
SELECT * FROM cew_menu_role WHERE mro_id_menu = @v_id_menu

