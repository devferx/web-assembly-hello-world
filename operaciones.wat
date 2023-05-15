(module
  ;; Importamos de JavaScript namespace
  (import "console" "log" (func $log (param i32 i32))) ;; Importamos la función log de la librería console
  (import "js" "mem" (memory 1));; Importamos 1 página de memoria (54kb)

  ;; Seccion de datos del módulo
  (data (i32.const 0) "Hello World from WebAssembly!")

  (func (export "sumar") (param i32 i32) (result i32)
    (local.get 0) ;; Obtener el primer parámetro
    (local.get 1) ;; Obtener el segundo parámetro
    (i32.add) ;; Sumar los dos parámetros
  )
  (func (export "restar") (param i32 i32) (result i32)
    (local.get 0) ;; Obtener el primer parámetro
    (local.get 1) ;; Obtener el segundo parámetro
    (i32.sub) ;; Restar los dos parámetros
  )
  (func (export "helloWorld")
    (i32.const 0) ;; Dirección de memoria donde se encuentra el string
    (i32.const 29) ;; Longitud del string
    (call $log) ;; Llamamos a la función log de la librería console
  )
)
