use cobis
go

declare @w_id_menu 		int,
		@w_id_parent	int,
		@w_id_producto	int,
		@w_id_url		varchar(300),
		@w_id_rol		int

--Asignacion de valores de producto y rol
select @w_id_producto = pd_producto from cl_producto where pd_descripcion = 'CLIENTES'
select @w_id_rol =  ro_rol from ad_rol where ro_descripcion = 'SEMILLERO'

select @w_id_url = 'MNU_REPOSITORIO_AAEN'
select @w_id_menu = me_id from cew_menu where me_name = @w_id_url

--Borrado de menu principal y submenus
if exists(select 1 from cew_menu where me_id = @w_id_menu)
begin
	delete from cew_menu_role where mro_id_menu in (select me_id from cew_menu where me_name = @w_id_url)
	                                or mro_id_menu in (select me_id from cew_menu where me_id_parent = @w_id_menu)
	delete from cew_menu where me_id_parent = @w_id_menu
	delete from cew_menu where me_name = @w_id_url
end

--Seleccion de ultimo ID
select @w_id_menu = max(me_id) from cew_menu
select @w_id_menu = @w_id_menu + 1

--Guardado del ID del menu principal, para registrar submenus
select @w_id_parent = @w_id_menu

-- CREACION DE MENU PRINCIPAL
insert into cew_menu (me_id,      me_id_parent, me_name, me_visible, me_url,      me_order, 
                      me_id_cobis_product, me_option,  me_description, me_version, me_container)
              values (@w_id_menu, NULL,         'MNU_REPOSITORIO_AAEN',   1, NULL, 1, 
                      @w_id_producto,      0,       'Menu para practica de repositorio',  NULL,       'CWC')

insert into cew_menu_role (mro_id_menu, mro_id_role)
values (@w_id_menu, @w_id_rol)


-- CREACION DE MENU NDQS
select @w_id_url = 'views/GITCL/GITTF/T_GITCLIPGIHTRM_950/1.0.0/VC_ESTUDIANDQ_249950_TASK.html'

select @w_id_menu = @w_id_menu + 1
insert into cew_menu (me_id,      me_id_parent, me_name,             me_visible, me_url,    me_order, 
                      me_id_cobis_product, me_option,  me_description, me_version, me_container)
              values (@w_id_menu, @w_id_parent, 'MNU_REPOSITORIO_AAEN_NDQS', 1,          @w_id_url, 1, 
                      @w_id_producto,      0,       'SubMenu para practica de repositorio',  NULL,       'CWC')

insert into cew_menu_role (mro_id_menu, mro_id_role)
values (@w_id_menu, @w_id_rol)

-- CREACION DE MENU ALLF
select @w_id_url = 'views/GITCL/GITTF/T_GITCLYRFNMHDS_898/1.0.0/VC_ESTUDIANTA_229898_TASK.html'

select @w_id_menu = @w_id_menu + 1
insert into cew_menu (me_id,      me_id_parent, me_name,             me_visible, me_url,    me_order, 
                      me_id_cobis_product, me_option,  me_description, me_version, me_container)
              values (@w_id_menu, @w_id_parent, 'MNU_REPOSITORIO_AAEN_ALLF', 1,          @w_id_url, 1, 
                      @w_id_producto,      0,       'SubMenu para practica de repositorio',  NULL,       'CWC')

insert into cew_menu_role (mro_id_menu, mro_id_role)
values (@w_id_menu, @w_id_rol)

-- CREACION DE MENU EEEV
select @w_id_url = 'views/GITCL/GITTF/T_GITCLCMGNSCXM_149/1.0.0/VC_ESTUDIANET_528149_TASK.html'

select @w_id_menu = @w_id_menu + 1
insert into cew_menu (me_id,      me_id_parent, me_name,             me_visible, me_url,    me_order, 
                      me_id_cobis_product, me_option,  me_description, me_version, me_container)
              values (@w_id_menu, @w_id_parent, 'MNU_REPOSITORIO_AAEN_EEEV', 1,          @w_id_url, 1, 
                      @w_id_producto,      0,       'SubMenu para practica de repositorio',  NULL,       'CWC')

insert into cew_menu_role (mro_id_menu, mro_id_role)
values (@w_id_menu, @w_id_rol)

--SELECT DE MENUS CREADOS
select * from cew_menu where me_name = 'MNU_REPOSITORIO_AAEN'
select * from cew_menu where me_name = 'MNU_REPOSITORIO_AAEN_NDQS'
select * from cew_menu where me_name = 'MNU_REPOSITORIO_AAEN_ALLF'
select * from cew_menu where me_name = 'MNU_REPOSITORIO_AAEN_EEEV'