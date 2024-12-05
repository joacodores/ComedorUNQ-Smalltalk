!classDefinition: #ComedorTest category: #ComedorUNQ!
TestCase subclass: #ComedorTest
	instanceVariableNames: 'comedorUnq pedro juana john menuDelDia menuEstudiantil papasFritas gaseosa newPedido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!ComedorTest methodsFor: 'setUp' stamp: 't 11/26/2024 16:39:48'!
setUp
	
	comedorUnq := ComedorUNQ new.
	
	pedro := Estudiante conLegajo: 10 conEfectivoDe:(8000*peso) objetoPagoDe: (2000*peso) conComedor: comedorUnq.
	
	juana := PersonalUNQ conLegajo: 23 conEfectivoDe:(8000*peso) objetoPagoDe: (0*peso)conComedor: comedorUnq.
	
	john := Externo conEfectivo:  (8000*peso) conObjetoPago: (5000*peso).
	
	menuDelDia := MenuDelDia initializeMenu.
	
	menuEstudiantil := MenuEstudiantil initializeMenu.
	 
	papasFritas := Gondola conPrecio: 500 * peso.
	
	gaseosa := Gondola conPrecio: 300 * peso.

	
	
	! !


!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/26/2024 14:42:41'!
test001_existeUnComedorQueEstaAbiertoSoloLosDiasHabilesDeLaSemanaYConDosRegistrados

	|unaFecha |
	unaFecha := November/ 13/ 2024.
	
	self assert:  (comedorUnq estaAbiertoElDia: unaFecha) equals: true.
	self assert: (comedorUnq registrados size) equals: 2.
	
	"los dias habiles de la semana son del 1 al 5 inclusive"! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/26/2024 14:41:59'!
test002_existeUnComedorQueQuiereAbrirUnDomingoPeroEstaCerrado

	|  unaFecha |
	
	unaFecha := November/ 17/ 2024.
	self assert: (comedorUnq estaAbiertoElDia: unaFecha)equals: false.
	
	"los dias habiles de la semana son del 1 al 5 inclusive"! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/26/2024 14:41:29'!
test003_existeLosComensalesQueSonEstudiantes_PersonalDeLaUNQ_YExternos_ConEfectivo
	
	self assert: (pedro efectivo ) equals: (8000*peso).
	self assert: (juana efectivo ) equals: (8000*peso).
	self assert: (john efectivo ) equals: (8000*peso).
	
	
	! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/26/2024 14:40:43'!
test004_existenLosProductosDelComedor_MenuEstudiantil_MenuDelDia_YLosDeGondola

	self assert: (menuEstudiantil precio) equals: (1000*peso).
	self assert: (menuDelDia precio) equals: (1200*peso).
	self assert: (papasFritas precio) equals: (500*peso).! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 'jd 11/20/2024 14:45:28'!
test005_unComedorNoTieneStockPorElMomento

	| comedorU |
	
	comedorU := ComedorUNQ new.
	
	self assert: (comedorU stock) isEmpty. ! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/28/2024 14:18:57'!
test006_unComedorRecargaSuStockConAlgunosProductos
	
	|unComedor papas|
	
	unComedor := ComedorUNQ new.
	
	papas := Gondola conPrecio: 1200*peso.
	
	unComedor añadirAlStock: papas.
	
	 self assert: (unComedor stock) equals: (Bag with: papas). ! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 'jd 11/20/2024 15:36:24'!
test007_Comedor_tiene_estudiantes_registrados_y_no_tiene_externos_registrados

	self assert: (comedorUnq tieneRegistradoA: pedro ) equals: true . "pedro es estudiante"
	self assert: (comedorUnq tieneRegistradoA: john ) equals: false. "john es externo"! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 'jd 11/20/2024 15:06:03'!
test008_estudiante_carga_la_tarjeta_comedor_con_efectivo_mil_pesos_de_saldo 

	pedro cargarTarjetaConEfectivo: (1000 * peso).
	
	self assert: (pedro saldoDeTarjeta) equals: (1000 * peso).  ! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 'jd 11/20/2024 15:06:07'!
test009_estudiante_carga_la_tarjeta_comedor_con_objetoPago_mil_pesos_de_saldo 

	pedro cargarTarjetaConObjetoPago: (1000 * peso).
	
	self assert: (pedro saldoDeTarjeta) equals: (1000 * peso).  ! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 'jd 11/20/2024 15:38:21'!
test010_existen_productos_con_descuento

	self assert: papasFritas tieneDescuento equals: true.
	self assert: menuEstudiantil tieneDescuento equals: false.
	self assert: menuDelDia tieneDescuento equals: true.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 'jd 11/20/2024 15:43:25'!
test011_existen_productos_solo_para_estudiantes

	self assert: papasFritas esSoloParaEstudiantes equals: false.
	self assert: menuEstudiantil esSoloParaEstudiantes equals: true.
	self assert: menuDelDia esSoloParaEstudiantes equals: false.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 13:52:28'!
test012_existe_un_pedido_con_productos
	
	|pedido2|
	
	pedido2 := Pedido hechoPor: john con: (OrderedCollection with: papasFritas with: gaseosa) elDia: November / 24 / 2024 conPagoDe: 'Efectivo'.
	
	self assert: pedido2 cantidadDeProductos equals: 2.
	self assert: pedido2 comensal equals: john.
	self assert: pedido2 precioTotal equals: (papasFritas precio + gaseosa precio)! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 'jd 11/26/2024 22:41:02'!
test013_comensal_hace_un_pedido_con_dos_productos_y_paga_con_efectivo
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	john hacerPedidoConEfectivoConProductos:(OrderedCollection with: papasFritas with: gaseosa) elDia: November / 24 / 2024 enComedor: comedorUnq.
	 
	self assert: john efectivo equals: 7120 * peso
	
	"la suma que hace el precio de las papas y la gaseosa y la otra suma es para el 10% de recargo"! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/26/2024 16:50:43'!
test014_estudiante_hace_un_pedido_con_tres_productos_y_paga_con_objeto_pago_y_tiene_recargo
	
	"pedro tiene 2000 pesos en objetoPago"
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	pedro hacerPedidoConObjetoPagoConProductos:(OrderedCollection with: menuEstudiantil with: papasFritas ) elDia: November / 25 / 2024 enComedor: comedorUnq.

	self assert: pedro saldoEnObjetoPago equals: 425* peso.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/26/2024 16:03:42'!
test015_personal_unq_hace_un_pedido_con_tres_productos_y_paga_con_tarjeta_unq_y_se_aplican_descuentos
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	juana cargarTarjetaConEfectivo: 2000 * peso.
	juana hacerPedidoConTarjetaConProductos:(OrderedCollection with: papasFritas with: gaseosa with: menuDelDia ) elDia: November / 25 / 2024 enComedor: comedorUnq.
	"el pedido con el descuento aplicado vale 1720 pesos" 
	
	self assert: juana saldoDeTarjeta equals: 280 * peso.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/28/2024 20:19:54'!
test016_comensal_no_tiene_suficiente_dinero_para_pagar_pedido_en_efectivo
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	"juana tiene 8000 pesos"
	juana cargarTarjetaConEfectivo: 6001 * peso. 
	"se cargo para que no tenga el efectivo suficiente"
	
	juana hacerPedidoConEfectivoConProductos:(OrderedCollection with: papasFritas with: gaseosa with: menuDelDia) elDia: November / 24 / 2024 enComedor: comedorUnq.	
	
	self assert: (juana efectivo) equals: 1999*peso. "juana no realiza la compra"
	
	
	! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/28/2024 20:20:56'!
test017_comensal_no_tiene_suficiente_dinero_para_pagar_pedido_con_objeto_pago
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	"juana tiene 0 pesos en objetoPago"
	juana ingresarDineroEnObjetoPago: (1500 * peso). 
	
	juana hacerPedidoConObjetoPagoConProductos:(OrderedCollection with: papasFritas with: gaseosa with: menuDelDia) elDia: November / 25 / 2024 enComedor: comedorUnq.
	
	self assert: (juana saldoEnObjetoPago) equals: (1500*peso).
	
	
! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/28/2024 20:21:03'!
test018_comensal_no_tiene_suficiente_dinero_para_pagar_pedido_con_tarjetaUNQPorLoQueNoSeConcretaElPago
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	juana cargarTarjetaConEfectivo: 1719 * peso. 
	
	juana hacerPedidoConTarjetaConProductos:(OrderedCollection with: papasFritas with: gaseosa with: menuDelDia) elDia: November / 25 / 2024 enComedor: comedorUnq.
	
	self assert: ((juana tarjetaComedor) saldo) equals: (1719*peso).
	
! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/26/2024 16:04:56'!
test019_estudiante_hace_un_pedido_con_tres_productos_y_paga_con_tarjeta_unq_y_se_aplican_descuentos
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	pedro cargarTarjetaConEfectivo: 2000 * peso.
	
	pedro hacerPedidoConTarjetaConProductos:(OrderedCollection with: papasFritas with: gaseosa with: menuDelDia ) elDia: November / 25 / 2024 enComedor: comedorUnq.
	"el pedido con el descuento aplicado vale 1920 pesos" 
	
	self assert: pedro saldoDeTarjeta equals: 80 * peso.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/28/2024 20:24:05'!
test020_personal_unq_no_puede_comprar_menu_estudiantil
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	self should: [juana hacerPedidoConEfectivoConProductos:(OrderedCollection with: papasFritas with: gaseosa with: menuEstudiantil) elDia: November / 25 / 2024 enComedor: comedorUnq.]
		raise: Error
		description: juana elComensalNoPuedeLlevarAlgunosProductos.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 'jd 11/26/2024 23:04:09'!
test021_estudiante_tiene_descuento_en_efectivo_los_lunes
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	pedro hacerPedidoConEfectivoConProductos:(OrderedCollection with: papasFritas with: gaseosa with: menuDelDia ) elDia: November / 25 / 2024 enComedor: comedorUnq.
	"el pedido se hace un lunes
	precioTotal= 2000 pesos
	productosConDescuentoPagandoEnEfectivoUnLunes= $1200 en menu del dia + $500 - 10% en papasFritas + $300 - 10% en gaseosa 
	precioFinal=1920 pesos"
	
	self assert: pedro efectivo equals: 6080 * peso.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 'jd 11/26/2024 21:16:26'!
test022_externo_paga_no_puede_comprar_menu_del_dia
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	self should: [john hacerPedidoConObjetoPagoConProductos: (OrderedCollection with: menuDelDia) elDia: November/26/2024 enComedor: comedorUnq] 
			raise: Error
				description: (john elComensalNoPuedeLlevarAlgunosProductos).
	
	! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 'jd 11/26/2024 21:17:59'!
test023_externo_paga_no_puede_comprar_menu_estudiantil
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	self should: [john hacerPedidoConObjetoPagoConProductos: (OrderedCollection with: menuEstudiantil ) elDia: November/26/2024 enComedor: comedorUnq]
			raise: Error
				description: (john elComensalNoPuedeLlevarAlgunosProductos).
	! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/28/2024 20:25:53'!
test024_unComensalExternoPagaConObjetoPagoYTieneDosRecargas

	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	"john tiene 5000 pesos en o.p."
	
	john hacerPedidoConObjetoPagoConProductos:(OrderedCollection with: papasFritas with: gaseosa) elDia: November / 25 / 2024 enComedor: comedorUnq.
	"se le cobra 800 pesos + 10%(80 pesos) por ser externo + 5%(40 pesos) por pagar con O.P. = 920 pesos"
	
	self assert: (john saldoEnObjetoPago) equals: 4080*peso.
	
! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 13:03:21'!
test025_externo_tiene_descuento_en_efectivo_los_lunes
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	john hacerPedidoConEfectivoConProductos:(OrderedCollection with: papasFritas with: gaseosa) elDia: November / 25 / 2024 enComedor: comedorUnq.
	"el pedido se hace un lunes
	precioTotal= 800 pesos
	recargoDeExterno= +80 pesos
	descuentoPagandoEnEfectivoUnLunes= -80 pesos
	precioFinal=800 pesos"
	
	self assert: john efectivo equals: 7200 * peso.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 'jd 11/26/2024 23:12:54'!
test026_personal_unq_tiene_descuento_en_efectivo_los_lunes
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil}).
	
	juana hacerPedidoConEfectivoConProductos:(OrderedCollection with: papasFritas with: gaseosa with: menuDelDia) elDia: November / 25/ 2024 enComedor: comedorUnq.
	"el pedido se hace un lunes
	precioTotal= 2000 pesos
	productosConDescuentoPagandoEnEfectivoUnLunes= $1200 en menu del dia + $500 - 10% en papasFritas + $300 - 10% en gaseosa 
	precioFinal=1920 pesos"
	
	self assert: juana efectivo equals: 6080 * peso.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 15:26:52'!
test027_unComedorPuedeSaberTodosLosPedidosQueSeHicieronUnDia
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil. papasFritas. papasFritas. papasFritas. gaseosa }).
	
	juana hacerPedidoConEfectivoConProductos:(OrderedCollection with: papasFritas) elDia: November / 25/ 2024 enComedor: comedorUnq.
	
	pedro hacerPedidoConEfectivoConProductos: (OrderedCollection with: gaseosa) elDia: November/ 25/ 2024 enComedor: comedorUnq .
	
	john hacerPedidoConEfectivoConProductos: (OrderedCollection with: papasFritas with: gaseosa) elDia: November/ 27/ 2024 enComedor: comedorUnq.
	
	Assert that: (comedorUnq pedidosHechosElDia:November/ 25/ 2024) size isEqualTo: 2.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 15:15:36'!
test028_unComedorPuedeSaberLosPedidosQueSeHicieronConUnMetodoDePago
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil. papasFritas. papasFritas. papasFritas }).
	
	juana hacerPedidoConEfectivoConProductos:(OrderedCollection with: menuDelDia ) elDia: November / 25/ 2024 enComedor: comedorUnq.
	
	pedro hacerPedidoConObjetoPagoConProductos: (OrderedCollection with: menuEstudiantil ) elDia: November/ 25/ 2024 enComedor: comedorUnq .
	
	john hacerPedidoConEfectivoConProductos: (OrderedCollection with: papasFritas with: gaseosa) elDia: November/ 27/ 2024 enComedor: comedorUnq.
	
	Assert that: (comedorUnq pedidosHechosConElMetodo: 'Objeto Pago') size isEqualTo: 1.
	Assert that: (comedorUnq pedidosHechosConElMetodo: 'Efectivo') size isEqualTo: 2.
	Assert that: (comedorUnq pedidosHechosConElMetodo: 'Tarjeta UNQ') size isEqualTo: 0.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 15:15:34'!
test029_unComedorPuedeSaberLosPedidosQueSonMayoresAUnPrecio
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil. papasFritas. papasFritas. papasFritas }).
	
	juana hacerPedidoConEfectivoConProductos:(OrderedCollection with: menuDelDia ) elDia: November / 25/ 2024 enComedor: comedorUnq.
	
	pedro hacerPedidoConObjetoPagoConProductos: (OrderedCollection with: menuEstudiantil with: papasFritas ) elDia: November/ 25/ 2024 enComedor: comedorUnq .
	
	john hacerPedidoConEfectivoConProductos: (OrderedCollection with: papasFritas with: gaseosa) elDia: November/ 27/ 2024 enComedor: comedorUnq.
	
	Assert that: (comedorUnq pedidosConPrecioMayorQue: (1000*peso)) size isEqualTo: 2.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 14:37:02'!
test030_unComedorPuedeSaberLosPedidosQueSonDeComensalesExternos
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil. papasFritas. papasFritas. papasFritas }).
	
	juana hacerPedidoConEfectivoConProductos:(OrderedCollection with: menuDelDia ) elDia: November / 25/ 2024 enComedor: comedorUnq.
	
	pedro hacerPedidoConObjetoPagoConProductos: (OrderedCollection with: menuEstudiantil with: papasFritas with: gaseosa with: papasFritas) elDia: November/ 25/ 2024 enComedor: comedorUnq .
	
	john hacerPedidoConEfectivoConProductos: (OrderedCollection with: papasFritas with: gaseosa) elDia: November/ 27/ 2024 enComedor: comedorUnq.
	
	Assert that: (comedorUnq pedidosHechosPorComensalesExternos) size isEqualTo: 1.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 14:36:25'!
test031_unComedorPuedeSaberLaGananciaTotal
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil. papasFritas. papasFritas. papasFritas }).
	
	juana hacerPedidoConEfectivoConProductos:(OrderedCollection with: menuDelDia ) elDia: November / 25/ 2024 enComedor: comedorUnq.
	
	pedro hacerPedidoConObjetoPagoConProductos: (OrderedCollection with: menuEstudiantil with: papasFritas with: gaseosa with: papasFritas) elDia: November/ 25/ 2024 enComedor: comedorUnq .
	
	john hacerPedidoConEfectivoConProductos: (OrderedCollection with: papasFritas with: gaseosa) elDia: November/ 27/ 2024 enComedor: comedorUnq.
	
	Assert that: (comedorUnq totalDeGanancia) isEqualTo: (2080*peso).
	
	"el comensal pedro no pudo pagar su pedido"! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 14:53:20'!
test032_unComedorPuedeSaberLaGananciaPorRegistradosYExternos
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil. papasFritas. papasFritas. papasFritas }).
	
	juana hacerPedidoConEfectivoConProductos:(OrderedCollection with: menuDelDia ) elDia: November / 25/ 2024 enComedor: comedorUnq.
	
	pedro hacerPedidoConObjetoPagoConProductos: (OrderedCollection with: menuEstudiantil with: papasFritas with: gaseosa with: papasFritas) elDia: November/ 25/ 2024 enComedor: comedorUnq .
	
	john hacerPedidoConEfectivoConProductos: (OrderedCollection with: papasFritas with: gaseosa) elDia: November/ 27/ 2024 enComedor: comedorUnq.
	
	Assert that: (comedorUnq gananciaPorExternos ) isEqualTo: 880*peso.
	Assert that: (comedorUnq gananciaPorRegistrados ) isEqualTo: 1200*peso.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 14:55:46'!
test033_unComedorPuedeSaberLosPedidosHechosLosLunesYSePagaronConEfectivo
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil. papasFritas. papasFritas. papasFritas }).
	
	juana hacerPedidoConEfectivoConProductos:(OrderedCollection with: menuDelDia ) elDia: November / 25/ 2024 enComedor: comedorUnq.
	
	pedro hacerPedidoConObjetoPagoConProductos: (OrderedCollection with: menuEstudiantil with: papasFritas with: gaseosa with: papasFritas) elDia: November/ 25/ 2024 enComedor: comedorUnq .
	
	john hacerPedidoConEfectivoConProductos: (OrderedCollection with: papasFritas with: gaseosa) elDia: November/ 27/ 2024 enComedor: comedorUnq.
	
	Assert that: (comedorUnq pedidosHechosLosLunesPagandoConEfectivo ) size isEqualTo: 1.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 15:07:38'!
test034_unComedorPuedeSaberCualEsElProductoMasPopular
	
	comedorUnq añadirAlStockLosProductos: (Bag withAll: {papasFritas. gaseosa. menuDelDia. menuEstudiantil. papasFritas. papasFritas. papasFritas }).
	
	juana hacerPedidoConEfectivoConProductos:(OrderedCollection with: menuDelDia ) elDia: November / 25/ 2024 enComedor: comedorUnq.
	
	pedro hacerPedidoConObjetoPagoConProductos: (OrderedCollection with: menuEstudiantil with: papasFritas with: gaseosa with: papasFritas) elDia: November/ 25/ 2024 enComedor: comedorUnq .
	
	john hacerPedidoConEfectivoConProductos: (OrderedCollection with: papasFritas with: gaseosa) elDia: November/ 27/ 2024 enComedor: comedorUnq.
	
	Assert that: (comedorUnq productoMasPopular) isEqualTo: papasFritas.! !

!ComedorTest methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 15:14:35'!
test035_unComedorQuiereSaberCualEsElProductoMasPopularPeroEstaVacio
	
	Assert should: [comedorUnq productoMasPopular]
	signal: Error
	withDescription: comedorUnq mensajeQueNoHayProductosPedidos.! !


!classDefinition: #ComedorUNQ category: #ComedorUNQ!
Object subclass: #ComedorUNQ
	instanceVariableNames: 'stock registrados pedidos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!ComedorUNQ methodsFor: 'action' stamp: 't 11/13/2024 10:43:12'!
añadirAlStock: unProducto

	stock add: unProducto.
	
	! !

!ComedorUNQ methodsFor: 'action' stamp: 't 11/26/2024 16:03:14'!
añadirAlStockLosProductos: productos

	stock addAll: productos.! !

!ComedorUNQ methodsFor: 'action' stamp: 't 11/27/2024 15:26:20'!
eliminarProductosDelPedido: unPedido
	
	| productosAEliminar |
	
	productosAEliminar := Bag new.
	
	productosAEliminar addAll: unPedido productos.
	
	stock removeAll: productosAEliminar.	! !

!ComedorUNQ methodsFor: 'action' stamp: 't 11/26/2024 15:51:25'!
guardarPedido: unPedido

	pedidos add: unPedido.! !

!ComedorUNQ methodsFor: 'action' stamp: 'T 11/13/2024 16:35:41'!
registrarComensal: comensal 

	registrados add: comensal.! !


!ComedorUNQ methodsFor: 'initialization' stamp: 't 11/26/2024 15:52:03'!
initialize 

	stock := Bag new.
	
	registrados := Set new.
	
	pedidos := Bag new.! !


!ComedorUNQ methodsFor: 'testing' stamp: 'T 11/13/2024 15:42:51'!
estaAbiertoElDia: aDate

	
	^ (aDate isSunday | aDate isSaturday ) not.
	! !

!ComedorUNQ methodsFor: 'testing' stamp: 'jd 11/27/2024 08:45:02'!
tieneRegistradoA: comensal 
	
	^(comensal tieneLegajo) and: [ (registrados anySatisfy: [:unComensal| unComensal numeroDeLegajo = comensal numeroDeLegajo])]! !


!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/26/2024 19:51:18'!
chequearQueEstenLosProductos: productos

	^ productos allSatisfy: [: producto | (stock occurrencesOf: producto) >= (productos occurrencesOf: producto)].! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 14:42:58'!
gananciaPorExternos
	
	^ self pedidosPagadosPorExternos sum: [:pedido | pedido precioFinal ].! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 14:42:03'!
gananciaPorRegistrados
	
	^(self pedidosPagadosDeRegistrados) sum: [:pedido |pedido precioFinal].! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 15:12:26'!
mensajeQueNoHayProductosPedidos
	
	^'El comedor actualmente no tiene pedidos hechos'.! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/26/2024 19:46:34'!
noHayProductosDelPedidoEnElStock

	^'Hay productos del pedido que no hay en el stock.'! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 14:12:56'!
pedidosConPrecioMayorQue: unPrecio

	^ pedidos select: [:pedido | pedido precioFinal > unPrecio].! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 13:55:33'!
pedidosHechosConElMetodo: unMetodo

	^pedidos select: [:pedido | pedido metodoDePago = unMetodo]
	
	! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 13:19:47'!
pedidosHechosElDia: unDia
	 
	^pedidos select: [:pedido | pedido dia = unDia].
	! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 14:51:28'!
pedidosHechosLosLunesPagandoConEfectivo
	
	^ self pedidosPagados select: [:pedido |((pedido metodoDePago = 'Efectivo' ) & (pedido dia isMonday))].  
	
	"como dice 'Cantidad de pedidos hechos el Lunes, pagados con efectivo' asumimos que los pedidos estan pagados"! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 14:15:08'!
pedidosHechosPorComensalesExternos
	
	^ pedidos select: [:pedido |pedido comensal tieneLegajo = false].! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 14:17:26'!
pedidosPagados
	
	^ pedidos select: [:pedido |pedido fuePagado = true].! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 14:42:25'!
pedidosPagadosDeRegistrados
	
	^self pedidosPagados select: [:pedido |pedido comensal tieneLegajo = true].! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 14:43:40'!
pedidosPagadosPorExternos
	
	^self pedidosPagados select: [:pedido | pedido comensal tieneLegajo = false]! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 15:14:51'!
productoMasPopular
	
	|productosEnLosPedidos|
	
	pedidos isEmpty ifTrue: [self error: self mensajeQueNoHayProductosPedidos].
	
	productosEnLosPedidos := Bag new.
	
	pedidos do: [:pedido |
        productosEnLosPedidos addAll: pedido productos ].
	
	^productosEnLosPedidos detectMax: [:producto |productosEnLosPedidos occurrencesOf: producto]
	
	"como es el mas popular, no necesariamente tuvo que haberse concretado el pedido.
	y si hay empate, elige a cualquiera"! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/12/2024 16:25:05'!
registrados
	
	^registrados! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/13/2024 10:39:24'!
stock
	
	^stock! !

!ComedorUNQ methodsFor: 'accesing' stamp: 't 11/27/2024 14:16:58'!
totalDeGanancia
	
	^self pedidosPagados sum: [:pedido |pedido precioFinal ].! !


!classDefinition: #Comensales category: #ComedorUNQ!
Object subclass: #Comensales
	instanceVariableNames: 'efectivo objetoPago pedidos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!Comensales methodsFor: 'errorCase' stamp: 't 11/26/2024 19:47:18'!
elComensalNoPuedeLlevarAlgunosProductos

	^'El comensal no puede llevar un producto del pedido.'! !


!Comensales methodsFor: 'accesing' stamp: 'T 11/13/2024 15:55:02'!
efectivo 
	^efectivo
	! !

!Comensales methodsFor: 'accesing' stamp: 'T 11/13/2024 15:57:28'!
saldoEnObjetoPago
	^ objetoPago 
	! !


!Comensales methodsFor: 'testing' stamp: 'jd 11/26/2024 12:27:50'!
puedeLlevarLoQueOrdenoEn: pedido

	^self subclassResponsibility ! !

!Comensales methodsFor: 'testing' stamp: 'jd 11/26/2024 23:07:06'!
tieneSuficienteDineroEnEfectivoPara: pedido

	^self efectivo >= pedido precioPagandoConEfectivo .! !

!Comensales methodsFor: 'testing' stamp: 't 11/26/2024 15:08:08'!
tieneSuficienteDineroEnObjetoPagoPara: pedido

	^ (self saldoEnObjetoPago) >= (pedido precioPagandoConObjetoPago) ! !


!Comensales methodsFor: 'action' stamp: 'jd 11/25/2024 18:20:49'!
agregarAPedidos: pedido

	pedidos add: pedido ! !

!Comensales methodsFor: 'action' stamp: 't 11/27/2024 15:21:45'!
hacerPedidoConEfectivoConProductos: productos elDia: dia enComedor: comedor
	
	| newPedido |
	
	(comedor chequearQueEstenLosProductos: productos) ifFalse: [self error: (comedor noHayProductosDelPedidoEnElStock)].
	
	newPedido := Pedido hechoPor: self con: productos elDia: dia conPagoDe: 'Efectivo'. 
	
	(self puedeLlevarLoQueOrdenoEn: newPedido) ifFalse: [self error: self elComensalNoPuedeLlevarAlgunosProductos].
	
	self agregarAPedidos: newPedido.
	
	self pagarPedidoConEfectivo: newPedido.
	
	comedor eliminarProductosDelPedido: newPedido.
	
	comedor guardarPedido: newPedido.! !

!Comensales methodsFor: 'action' stamp: 't 11/27/2024 13:49:03'!
hacerPedidoConObjetoPagoConProductos: productos elDia: dia enComedor: comedor
	
	| newPedido |
	
	(comedor chequearQueEstenLosProductos: productos) ifFalse: [self error: (comedor noHayProductosDelPedidoEnElStock)].
	
	newPedido := Pedido hechoPor: self con: productos elDia: dia conPagoDe: 'Objeto Pago'. 
	
	(self puedeLlevarLoQueOrdenoEn: newPedido) ifFalse: [self error: self elComensalNoPuedeLlevarAlgunosProductos].
	
	self agregarAPedidos: newPedido.
	
	self pagarPedidoConObjetoPago: newPedido.
	
	comedor guardarPedido: newPedido.! !

!Comensales methodsFor: 'action' stamp: 'jd 11/25/2024 20:45:45'!
ingresarDineroEnObjetoPago: cantidadDeDinero

	objetoPago := self saldoEnObjetoPago + cantidadDeDinero ! !

!Comensales methodsFor: 'action' stamp: 'jd 11/25/2024 18:26:07'!
pagarPedidoConEfectivo: pedido

	^self subclassResponsibility ! !

!Comensales methodsFor: 'action' stamp: 't 11/28/2024 03:00:13'!
pagarPedidoConObjetoPago: pedido

	(self tieneSuficienteDineroEnObjetoPagoPara: pedido) ifTrue: [
						objetoPago := ((self saldoEnObjetoPago) - (pedido precioPagandoConObjetoPago)).
						pedido seConcretoElPago]! !

!Comensales methodsFor: 'action' stamp: 'T 11/13/2024 16:36:22'!
registrarComensalEnComedor: comedor

	comedor registrarComensal: self.! !


!classDefinition: #Externo category: #ComedorUNQ!
Comensales subclass: #Externo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!Externo methodsFor: 'initialization' stamp: 'jd 11/25/2024 18:22:26'!
initializeConEfectivo: dinero conObjetoPago: objetoP

	efectivo := dinero.
	objetoPago := objetoP .
	pedidos := OrderedCollection new.! !


!Externo methodsFor: 'action' stamp: 't 11/28/2024 02:59:58'!
pagarPedidoConEfectivo: pedido

	(self tieneSuficienteDineroEnEfectivoPara: pedido) ifTrue: [
						efectivo := (self efectivo - (pedido precioParaExternoPagandoConEfectivo )).
						pedido seConcretoElPago]
! !

!Externo methodsFor: 'action' stamp: 't 11/28/2024 03:00:37'!
pagarPedidoConObjetoPago: pedido

	(self tieneSuficienteDineroEnObjetoPagoPara: pedido) ifTrue: [
						objetoPago := ((self saldoEnObjetoPago) - (pedido precioParaExternoPagandoConObjetoPago )).
						pedido seConcretoElPago]! !


!Externo methodsFor: 'testing' stamp: 't 11/26/2024 14:11:19'!
puedeLlevarLoQueOrdenoEn: pedido

	^ (pedido noIncluyeMenuEstudiantil) & (pedido noIncluyeMenuDelDia)! !

!Externo methodsFor: 'testing' stamp: 'jd 11/20/2024 15:30:59'!
tieneLegajo
	^false! !

!Externo methodsFor: 'testing' stamp: 'jd 11/26/2024 23:10:34'!
tieneSuficienteDineroEnEfectivoPara: pedido

	^self efectivo >= pedido precioParaExternoPagandoConEfectivo .! !

!Externo methodsFor: 'testing' stamp: 'jd 11/26/2024 23:10:55'!
tieneSuficienteDineroEnObjetoPagoPara: pedido

	^ (self saldoEnObjetoPago) >= (pedido precioParaExternoPagandoConObjetoPago )! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Externo class' category: #ComedorUNQ!
Externo class
	instanceVariableNames: ''!

!Externo class methodsFor: 'as yet unclassified' stamp: 'T 11/13/2024 16:00:10'!
conEfectivo: dinero conObjetoPago: objetoP

	^self new initializeConEfectivo: dinero conObjetoPago: objetoP .! !


!classDefinition: #Registrado category: #ComedorUNQ!
Comensales subclass: #Registrado
	instanceVariableNames: 'legajo tarjetaComedor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!Registrado methodsFor: 'initialization' stamp: 't 11/26/2024 13:37:25'!
initializeConLegajo: numeroLegajo conEfectivoDe: cantidadEfectivo objetoPagoDe: objetoP enComedor: comedor
	
	pedidos := OrderedCollection new.
	tarjetaComedor  := TarjetaDeComedor new.
	legajo := numeroLegajo.
	efectivo := cantidadEfectivo.
	objetoPago := objetoP.
	
	self registrarComensalEnComedor: comedor.
	
	
! !


!Registrado methodsFor: 'action' stamp: 'jd 11/26/2024 11:02:17'!
cargarTarjetaConEfectivo: unaCantidadACargar 
	
	unaCantidadACargar <= (self efectivo) ifFalse: [self error: 'No tiene efectivo suficiente para cargar la tarjeta'].
	
	efectivo := self efectivo - unaCantidadACargar.
	
	tarjetaComedor añadirSaldo: unaCantidadACargar.! !

!Registrado methodsFor: 'action' stamp: 'jd 11/26/2024 11:02:31'!
cargarTarjetaConObjetoPago: unaCantidadACargar

	unaCantidadACargar <= (self saldoEnObjetoPago) ifFalse: [self error: 'No tiene efectivo suficiente para cargar la tarjeta'].
	
	objetoPago := self saldoEnObjetoPago - unaCantidadACargar.
	
	tarjetaComedor añadirSaldo: unaCantidadACargar. 
	
	! !

!Registrado methodsFor: 'action' stamp: 't 11/27/2024 13:49:24'!
hacerPedidoConTarjetaConProductos: productos elDia: dia enComedor: comedor
	
	| newPedido |
	
	(comedor chequearQueEstenLosProductos: productos) ifFalse: [self error: (comedor noHayProductosDelPedidoEnElStock)].
	
	newPedido := Pedido hechoPor: self con: productos elDia: dia conPagoDe: 'Tarjeta UNQ'. 
	
	(self puedeLlevarLoQueOrdenoEn: newPedido) ifFalse: [self error: self elComensalNoPuedeLlevarAlgunosProductos].
	
	self agregarAPedidos: newPedido.
	
	self pagarPedidoConTarjetaUNQ: newPedido.
	
	comedor guardarPedido: newPedido.
! !

!Registrado methodsFor: 'action' stamp: 't 11/28/2024 02:59:47'!
pagarPedidoConEfectivo: pedido

	(self tieneSuficienteDineroEnEfectivoPara: pedido) ifTrue: [
						efectivo := (efectivo - (pedido precioPagandoConEfectivo )).
						pedido seConcretoElPago]! !

!Registrado methodsFor: 'action' stamp: 'jd 11/26/2024 00:29:29'!
pagarPedidoConTarjetaUNQ: pedido

	^self subclassResponsibility ! !


!Registrado methodsFor: 'accesing' stamp: 'jd 11/20/2024 15:07:34'!
numeroDeLegajo 
	^legajo! !

!Registrado methodsFor: 'accesing' stamp: 'jd 11/20/2024 14:50:17'!
saldoDeTarjeta
	^tarjetaComedor saldo ! !

!Registrado methodsFor: 'accesing' stamp: 'jd 11/20/2024 15:06:56'!
tarjetaComedor
	^tarjetaComedor! !

!Registrado methodsFor: 'accesing' stamp: 'jd 11/26/2024 12:05:45'!
tieneSuficienteSaldoEnTarjetaPara: pedido

	^self subclassResponsibility ! !


!Registrado methodsFor: 'testing' stamp: 'jd 11/20/2024 15:31:14'!
tieneLegajo
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Registrado class' category: #ComedorUNQ!
Registrado class
	instanceVariableNames: ''!

!Registrado class methodsFor: 'instance creation' stamp: 'jd 11/20/2024 14:50:17'!
conLegajo: numeroLegajo conEfectivoDe: cantidadEfectivo objetoPagoDe: objetoP conComedor: comedor
	
	^self new initializeConLegajo: numeroLegajo conEfectivoDe: cantidadEfectivo objetoPagoDe: objetoP enComedor: comedor! !


!classDefinition: #Estudiante category: #ComedorUNQ!
Registrado subclass: #Estudiante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!Estudiante methodsFor: 'testing' stamp: 'jd 11/26/2024 12:29:17'!
puedeLlevarLoQueOrdenoEn: pedido

	^pedido noIncluyeMasDeUnMenuEstudiantil! !

!Estudiante methodsFor: 'testing' stamp: 'jd 11/26/2024 12:05:28'!
tieneSuficienteSaldoEnTarjetaPara: pedido

	^self saldoDeTarjeta >= pedido precioParaEstudiantePagandoConTarjetaUNQ ! !


!Estudiante methodsFor: 'action' stamp: 't 11/28/2024 03:00:48'!
pagarPedidoConTarjetaUNQ: pedido

	(self tieneSuficienteSaldoEnTarjetaPara: pedido) ifTrue: [tarjetaComedor debitarSaldo:
														( pedido precioParaEstudiantePagandoConTarjetaUNQ ).
														pedido seConcretoElPago]! !


!classDefinition: #PersonalUNQ category: #ComedorUNQ!
Registrado subclass: #PersonalUNQ
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!PersonalUNQ methodsFor: 'testing' stamp: 'jd 11/26/2024 13:08:38'!
puedeLlevarLoQueOrdenoEn: pedido

	^pedido noIncluyeMenuEstudiantil! !

!PersonalUNQ methodsFor: 'testing' stamp: 't 11/26/2024 13:28:45'!
tieneSuficienteSaldoEnTarjetaPara: pedido

	^(self saldoDeTarjeta) >= (pedido precioParaPersonalPagandoConTarjetaUNQ) ! !


!PersonalUNQ methodsFor: 'action' stamp: 't 11/28/2024 03:00:57'!
pagarPedidoConTarjetaUNQ: pedido

	(self tieneSuficienteSaldoEnTarjetaPara: pedido) ifTrue: [tarjetaComedor debitarSaldo:
														( pedido precioParaPersonalPagandoConTarjetaUNQ ).
														pedido seConcretoElPago]! !


!classDefinition: #Pedido category: #ComedorUNQ!
Object subclass: #Pedido
	instanceVariableNames: 'comensal precioFinal dia productos fuePagado metodoDePago'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!Pedido methodsFor: 'initialization' stamp: 't 11/27/2024 15:01:07'!
initializePedidoHechoPor: comensalDePedido con: productosDePedido elDia: diaDePedido conPagoDe: unMetodo

	productos := Bag new addAll: productosDePedido.
	dia  := diaDePedido. 
	comensal := comensalDePedido.
	fuePagado := false.
	metodoDePago := unMetodo .
	
	
	

	! !


!Pedido methodsFor: 'accesing' stamp: 'jd 11/25/2024 18:48:02'!
cantidadDeProductos
	^productos size ! !

!Pedido methodsFor: 'accesing' stamp: 'jd 11/25/2024 18:48:34'!
comensal
	
	^comensal! !

!Pedido methodsFor: 'accesing' stamp: 'jd 11/26/2024 22:31:06'!
dia
	^dia! !

!Pedido methodsFor: 'accesing' stamp: 't 11/26/2024 13:55:51'!
fuePagado

	^fuePagado.! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 13:54:34'!
metodoDePago
	
	^metodoDePago! !

!Pedido methodsFor: 'accesing' stamp: 'jd 11/26/2024 12:32:48'!
noIncluyeMasDeUnMenuEstudiantil
	^ (productos select:[:unProducto | unProducto esMenuEstudiantil ]) size < 2.! !

!Pedido methodsFor: 'accesing' stamp: 't 11/26/2024 14:12:19'!
noIncluyeMenuDelDia

	^ (productos anySatisfy: [: unProducto| unProducto esMenuDelDia]) not.! !

!Pedido methodsFor: 'accesing' stamp: 'jd 11/26/2024 13:14:32'!
noIncluyeMenuEstudiantil
	^ (productos anySatisfy:[:unProducto | unProducto esMenuEstudiantil ] )not.! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:09:54'!
precioConRecargaAlExterno

	^ self precioTotal + (self precioTotal * 0.10)! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:13:03'!
precioFinal
	
	^precioFinal! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:04:50'!
precioPagandoConEfectivo
	
	(self dia isMonday) 
	ifTrue: 
		[	precioFinal := self precioPagandoLosProductosUnLunes.
			^self precioPagandoLosProductosUnLunes ]
	ifFalse:
		[	precioFinal := self precioTotal.
			^self precioTotal.]	! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:32:43'!
precioPagandoConObjetoPago
	
	precioFinal := self precioTotalParaRegistradosPagandoConObjetoPago.
	
	^self precioTotalParaRegistradosPagandoConObjetoPago.! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:11:20'!
precioPagandoLosProductosParaExternoConObjetoPago

	^ (self precioTotal) + (self precioTotal * self recargaAlExternoUsandoObjetoPago)! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:08:39'!
precioPagandoLosProductosParaUnEstudianteConTarjeta

	^ productos sum:[:unProducto | unProducto precioDeProductoConTarjetaUNQParaEstudiante ]! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:04:31'!
precioPagandoLosProductosUnLunes

	^ productos sum: [: unProducto | unProducto precioEnEfectivoLosLunes  ]! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:12:30'!
precioPagandoParaPersonalUsandoLaTarjetaUNQ

	^ productos sum:[:unProducto | unProducto precioDeProductoConTarjetaUNQParaPersonal ]! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:08:39'!
precioParaEstudiantePagandoConTarjetaUNQ
	
	precioFinal := self precioPagandoLosProductosParaUnEstudianteConTarjeta.
	
	^self precioPagandoLosProductosParaUnEstudianteConTarjeta! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:09:54'!
precioParaExternoPagandoConEfectivo
	
	(self dia isMonday) 
	ifTrue:
		[	precioFinal := self precioTotal.
			^self precioTotal]
	ifFalse:
		[	precioFinal := self precioConRecargaAlExterno.
			^self precioConRecargaAlExterno ]! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:11:35'!
precioParaExternoPagandoConObjetoPago
	
	precioFinal := self precioPagandoLosProductosParaExternoConObjetoPago.
	
	^ self precioPagandoLosProductosParaExternoConObjetoPago! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:12:30'!
precioParaPersonalPagandoConTarjetaUNQ
	
	precioFinal := self precioPagandoParaPersonalUsandoLaTarjetaUNQ.
	
	^self precioPagandoParaPersonalUsandoLaTarjetaUNQ! !

!Pedido methodsFor: 'accesing' stamp: 't 11/26/2024 16:22:53'!
precioTotal

	^productos sum: [: unProducto | unProducto precio  ] 
	
	

	! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:07:13'!
precioTotalParaRegistradosPagandoConObjetoPago

	^(self precioTotal) + ((self precioTotal) * self recargaPagandoConObjetoPago ).! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:59:23'!
productos

	^productos.! !

!Pedido methodsFor: 'accesing' stamp: 't 11/27/2024 14:10:45'!
recargaAlExternoUsandoObjetoPago

	^ self recargaParaExterno +self recargaPagandoConObjetoPago! !

!Pedido methodsFor: 'accesing' stamp: 'jd 11/26/2024 21:55:01'!
recargaPagandoConObjetoPago
	^0.05! !

!Pedido methodsFor: 'accesing' stamp: 'jd 11/26/2024 21:54:42'!
recargaParaExterno
	^0.10! !

!Pedido methodsFor: 'accesing' stamp: 't 11/26/2024 13:57:06'!
seConcretoElPago
	
	fuePagado := true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pedido class' category: #ComedorUNQ!
Pedido class
	instanceVariableNames: ''!

!Pedido class methodsFor: 'as yet unclassified' stamp: 't 11/27/2024 13:51:24'!
hechoPor: comensal con: producto elDia: dia conPagoDe: unMetodo

	^ self new initializePedidoHechoPor: comensal con: producto elDia: dia conPagoDe: unMetodo! !


!classDefinition: #Producto category: #ComedorUNQ!
Object subclass: #Producto
	instanceVariableNames: 'precio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!Producto methodsFor: 'initialization' stamp: 't 11/11/2024 16:31:11'!
initializeConPrecio: unPrecio 
	
	precio := unPrecio.! !


!Producto methodsFor: 'accesing' stamp: 'jd 11/26/2024 00:40:03'!
descuentoParaEstudiante

	^self subclassResponsibility ! !

!Producto methodsFor: 'accesing' stamp: 'jd 11/26/2024 00:40:11'!
descuentoParaPersonal

	^self subclassResponsibility ! !

!Producto methodsFor: 'accesing' stamp: 't 11/11/2024 16:31:18'!
precio
	
	^precio! !

!Producto methodsFor: 'accesing' stamp: 'jd 11/26/2024 21:58:26'!
precioDeProductoConTarjetaUNQParaEstudiante

	^self precio - (self precio * self descuentoParaEstudiante) ! !

!Producto methodsFor: 'accesing' stamp: 'jd 11/26/2024 21:58:35'!
precioDeProductoConTarjetaUNQParaPersonal

	^(self precio) - (self precio * self descuentoParaPersonal)! !

!Producto methodsFor: 'accesing' stamp: 'jd 11/26/2024 23:00:32'!
precioEnEfectivoLosLunes
	^precio ! !


!Producto methodsFor: 'testing' stamp: 't 11/26/2024 14:12:44'!
esMenuDelDia

	^false! !

!Producto methodsFor: 'testing' stamp: 't 11/26/2024 14:12:59'!
esMenuEstudiantil
	^false! !

!Producto methodsFor: 'testing' stamp: 'jd 11/20/2024 15:42:35'!
esSoloParaEstudiantes
	^false! !

!Producto methodsFor: 'testing' stamp: 'jd 11/20/2024 15:22:56'!
tieneDescuento 
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Producto class' category: #ComedorUNQ!
Producto class
	instanceVariableNames: ''!

!Producto class methodsFor: 'instance creation' stamp: 't 11/11/2024 16:31:03'!
conPrecio: unPrecio
	
	^self new initializeConPrecio: unPrecio.! !


!classDefinition: #Gondola category: #ComedorUNQ!
Producto subclass: #Gondola
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!Gondola methodsFor: 'accesing' stamp: 'jd 11/26/2024 23:00:20'!
descuentoPagandoEnEfectivoLosLunes
	^0.10! !

!Gondola methodsFor: 'accesing' stamp: 'jd 11/26/2024 22:02:55'!
descuentoParaEstudiante 
	^ 0.1        "10% de descuento"! !

!Gondola methodsFor: 'accesing' stamp: 'jd 11/26/2024 22:01:31'!
descuentoParaPersonal
	^0.05        "5% de descuento"! !

!Gondola methodsFor: 'accesing' stamp: 'jd 11/26/2024 23:00:12'!
precioEnEfectivoLosLunes
	^self precio - (self precio * self descuentoPagandoEnEfectivoLosLunes)! !


!Gondola methodsFor: 'testing' stamp: 'jd 11/26/2024 00:47:10'!
tieneDescuento
	^true! !


!classDefinition: #MenuDelDia category: #ComedorUNQ!
Producto subclass: #MenuDelDia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!MenuDelDia methodsFor: 'initialization' stamp: 'jd 11/20/2024 15:14:04'!
initialize
	precio := 1200 * peso. ! !


!MenuDelDia methodsFor: 'accesing' stamp: 'jd 11/20/2024 15:20:12'!
descuentoParaEstudiante
	^0      "No hay descuento"! !

!MenuDelDia methodsFor: 'accesing' stamp: 'jd 11/26/2024 21:57:58'!
descuentoParaPersonal
	^0.2      "20% de descuento"! !

!MenuDelDia methodsFor: 'accesing' stamp: 't 11/26/2024 14:13:21'!
esMenuDelDia

	^true. ! !

!MenuDelDia methodsFor: 'accesing' stamp: 'jd 11/25/2024 18:53:59'!
precio 
	^precio! !


!MenuDelDia methodsFor: 'testing' stamp: 'jd 11/20/2024 15:21:35'!
tieneDescuento
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MenuDelDia class' category: #ComedorUNQ!
MenuDelDia class
	instanceVariableNames: ''!

!MenuDelDia class methodsFor: 'testing' stamp: 'jd 11/25/2024 18:57:48'!
initializeMenu
	^self new initialize.! !


!classDefinition: #MenuEstudiantil category: #ComedorUNQ!
Producto subclass: #MenuEstudiantil
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!MenuEstudiantil methodsFor: 'testing' stamp: 'jd 11/26/2024 12:33:06'!
esMenuEstudiantil
	^true! !

!MenuEstudiantil methodsFor: 'testing' stamp: 'jd 11/20/2024 15:41:39'!
esSoloParaEstudiantes 
	^true! !

!MenuEstudiantil methodsFor: 'testing' stamp: 'jd 11/20/2024 15:21:17'!
tieneDescuento
	^false! !


!MenuEstudiantil methodsFor: 'initialization' stamp: 'jd 11/20/2024 15:14:45'!
initialize
	precio := 1000 * peso. ! !


!MenuEstudiantil methodsFor: 'accesing' stamp: 'jd 11/26/2024 00:41:33'!
descuentoParaEstudiante

	^0! !

!MenuEstudiantil methodsFor: 'accesing' stamp: 'jd 11/26/2024 00:41:38'!
descuentoParaPersonal

	^0! !

!MenuEstudiantil methodsFor: 'accesing' stamp: 'jd 11/25/2024 18:54:06'!
precio 
	^precio! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MenuEstudiantil class' category: #ComedorUNQ!
MenuEstudiantil class
	instanceVariableNames: ''!

!MenuEstudiantil class methodsFor: 'testing' stamp: 'jd 11/25/2024 18:57:54'!
initializeMenu
	^self new initialize.! !


!classDefinition: #TarjetaDeComedor category: #ComedorUNQ!
Object subclass: #TarjetaDeComedor
	instanceVariableNames: 'saldo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ComedorUNQ'!

!TarjetaDeComedor methodsFor: 'initialization' stamp: 'T 11/13/2024 17:04:05'!
initialize
	
	saldo := 0 * peso.! !


!TarjetaDeComedor methodsFor: 'accessing' stamp: 'T 11/13/2024 16:02:44'!
saldo 
	^saldo! !


!TarjetaDeComedor methodsFor: 'action' stamp: 'T 11/13/2024 16:04:47'!
añadirSaldo: cantidadDeDinero 

	saldo := saldo + cantidadDeDinero ! !

!TarjetaDeComedor methodsFor: 'action' stamp: 't 11/26/2024 13:54:55'!
debitarSaldo: cantidadDeDinero 

	saldo := saldo - cantidadDeDinero.! !
