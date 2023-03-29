# ALU

## top_module

El módulo top_module es el módulo superior que conecta los diferentes
componentes del sistema y se encarga de la lógica de control del
sistema. El módulo tiene varios puertos de entrada y salida, como se
describe a continuación:

- change_switches: este puerto de entrada se utiliza para cambiar la
    configuración de los interruptores de entrada del sistema.

- a: este puerto de entrada representa el primer número de entrada
    para la ALU.

- b: este puerto de entrada representa el segundo número de entrada
    para la ALU.

- uc: este puerto de entrada representa los bits de control para la
    ALU.

- display_units: este puerto de salida proporciona la salida para
    el display de siete segmentos que representa la unidad de la
    salida de la ALU.

- display_tens: este puerto de salida proporciona la salida para el
    display de siete segmentos que representa la décima de la salida
    de la ALU.

- display_sign: este puerto de salida proporciona la salida para el
    display de siete segmentos que representa el signo del número de
    salida.

- leds_result: este puerto de salida proporciona la salida para los
    últimos cuatro LEDs que representan la salida de la ALU cuando
    está en modo AND, OR, XOR.

- leds_flags: este puerto de salida proporciona la salida para los
    primeros cuatro LEDs que representan la salida de las flags de la
    ALU.

Para implementar la funcionalidad que deseas, necesitas diseñar una
ALU que pueda realizar las operaciones lógicas y aritméticas que
necesitas. Puedes hacer esto creando un módulo ALU parametrizable
que toma los bits de ancho de los operandos y los bits de control
como parámetros de entrada. Este módulo debería ser capaz de realizar
todas las operaciones lógicas y aritméticas que necesitas.

Luego, puedes conectar los puertos de entrada y salida del módulo
top_module a los puertos del módulo ALU y escribir la lógica de
control necesaria para cambiar la configuración de los interruptores
de entrada, mostrar los resultados en los dispositivos de
visualización y enviar las señales de salida adecuadas a los LEDs
de salida.

Es importante tener en cuenta las limitaciones de tu FPGA, como la
cantidad de recursos lógicos, la cantidad de memoria disponible y
la velocidad del reloj máximo admitido. Deberás asegurarte de que
tu diseño sea compatible con estas limitaciones para garantizar que
se pueda implementar correctamente en tu FPGA.
