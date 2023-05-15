var memory = new WebAssembly.Memory({ initial: 1 });


function consoleLogString(offset, length) {
  var bytes = new Uint8Array(memory.buffer, offset, length);
  var string = new TextDecoder('utf8').decode(bytes);
  console.log(string);
};

const importObject = {
  console: {
    log: consoleLogString
  },
  js: {
    mem: memory
  }
};


fetch('operaciones.wasm')
  .then(response => response.arrayBuffer())
  .then(bytes => WebAssembly.instantiate(bytes, importObject))
  .then(results => {
    const { instance } = results;
    const sumar = instance.exports.sumar;
    const restar = instance.exports.restar;
    const helloWorld = instance.exports.helloWorld;

    helloWorld();

    const resultadoSuma = sumar(3, 4);
    console.log('Resultado suma:', resultadoSuma);

    const resultadoResta = restar(8, 5);
    console.log('Resultado resta:', resultadoResta);

  });
