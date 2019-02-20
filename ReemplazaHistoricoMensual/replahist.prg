APPLICATION.VISIBLE = .F.
ruta = GETDIR()
DIMENSION tablas[14]
tablas[1] = "MXFAC"
tablas[2] = "MXCTC"
tablas[3] = "MXITE"
tablas[4] = "MXAUD"
tablas[5] = "MXCTR"
tablas[6] = "MXCAJ"
tablas[7] = "MXCJM"
tablas[8] = "MXGAS"
tablas[9] = "MXPAG"
tablas[10] = "MXITC"
tablas[11] = "MXSTK"
tablas[12] = "MXMVS"
tablas[13] = "MXMOV"
tablas[14] = "MXVEC"

FOR EACH tablaActual IN tablas
	WAIT WINDOW ("Procesando " + tablaActual) TIMEOUT 3	
	USE (ruta + tablaActual)
	REPLACE ALL fecha WITH GOMONTH(fecha, 1)	
	
	* PARA MXFAC ! ! !
	IF tablaActual = "MXFAC"
		WAIT WINDOW ("Procesando fecha_ent de " + tablaActual) TIMEOUT 3
		REPLACE ALL fecha_ent WITH GOMONTH(fecha_ent, 1)
		WAIT WINDOW ("Procesando fecha_fis de " + tablaActual) TIMEOUT 3
		REPLACE ALL fecha_fis WITH GOMONTH(fecha_fis, 1)
	ENDIF
	
	* PARA MXGAS ! ! !
	IF tablaActual = "MXGAS"
		WAIT WINDOW ("Procesando fecha_ing de " + tablaActual) TIMEOUT 3
		REPLACE ALL fecha_ing WITH GOMONTH(fecha_ing, 1)
		WAIT WINDOW ("Procesando fecha_iva de " + tablaActual) TIMEOUT 3
		REPLACE ALL fecha_iva WITH GOMONTH(fecha_iva, 1)
	ENDIF
	
	* PARA MXMOV ! ! !
	IF tablaActual = "MXMOV"
		WAIT WINDOW ("Procesando fecha_cob de " + tablaActual) TIMEOUT 3
		REPLACE ALL fecha_cob WITH GOMONTH(fecha_cob, 1)
	ENDIF
	
	* PARA MXPAG ! ! !
	IF tablaActual = "MXPAG"
		WAIT WINDOW ("Procesando referencia de " + tablaActual) TIMEOUT 3
		GO TOP
		DO WHILE !EOF()

		valorMes = SUBSTR(referencia,5,2)

		DO CASE
			CASE valorMes = "12"
				REPLACE REFERENCIA WITH SUBSTR(referencia, 1, 4) + "01" + SUBSTR(referencia, 7, 10)
			CASE valorMes = "09"
				REPLACE REFERENCIA WITH ALLTRIM(SUBSTR(referencia, 1, 4)) + "10" + SUBSTR(referencia, 7, 10)
			OTHERWISE
				IF (SUBSTR(referencia,5,1) = "0")
					REPLACE REFERENCIA WITH ALLTRIM(SUBSTR(referencia, 1, 4))+ "0" + ALLTRIM(STR(VAL(valorMes) + 1)) + SUBSTR(referencia, 7, 10)
				ELSE
					REPLACE REFERENCIA WITH ALLTRIM(SUBSTR(referencia, 1, 4)) + ALLTRIM(STR(VAL(valorMes) + 1)) + SUBSTR(referencia, 7, 10)
				ENDIF
	
		ENDCASE

		SKIP
		ENDDO
	ENDIF
	USE
ENDFOR	

WAIT WINDOW "Finalizado."

CLOSE ALL
QUIT



